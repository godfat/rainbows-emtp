# -*- encoding: binary -*-
# :enddoc:
class Rainbows::EventMachineThreadPool::Client <
      Rainbows::EventMachine::Client

  def app_dispatch
    EM.defer(method(:app_response), method(:response_write))
  end

  def app_call input
    @deferred = true # we defer immediately
    set_comm_inactivity_timeout 0
    @env[RACK_INPUT] = input
    @env[REMOTE_ADDR] = @_io.kgio_addr
    @env[ASYNC_CALLBACK] = method(:write_async_response)
    @env[ASYNC_CLOSE] = EM::DefaultDeferrable.new
    @hp.hijack_setup(@env, @_io)
    app_dispatch # must be implemented by subclass
  end

  # this is only called in the master thread
  def response_write(response)
    if @hp.hijacked?
      @deferred = nil
      hijacked
    elsif nil == response[0] || -1 == response[0]
      @deferred = true
    else
      @deferred = nil
      ev_write_response(*response, @hp.next?)
    end
    rescue => e
      @deferred = nil
      handle_error(e)
  end

  # fails-safe application dispatch, we absolutely cannot
  # afford to fail or raise an exception (killing the thread)
  # here because that could cause a deadlock and we'd leak FDs
  def app_response
    APP.call(@env.merge!(RACK_DEFAULTS))
    rescue => e
      Rainbows::Error.app(e) # we guarantee this does not raise
      [ 500, {}, [] ]
  end

end
