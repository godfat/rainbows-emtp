
require 'rainbows/event_machine_thread_pool'

class Rainbows::EventMachineThreadPool::Client <
      Rainbows::EventMachine::Client

  def app_call input
    # begin Copied from Rainbows::EventMachine::Client#app_call
    set_comm_inactivity_timeout 0
    @env[RACK_INPUT] = input
    @env[REMOTE_ADDR] = @_io.kgio_addr
    @env[ASYNC_CALLBACK] = method(:write_async_response)
    @env[ASYNC_CLOSE] = EM::DefaultDeferrable.new
    @hp.hijack_setup(@env, @_io)
    # end Copied from Rainbows::EventMachine::Client#app_call

    @deferred = true # We defer immediately
    EM.defer do      # Queue the application call to EM's job queue
      begin
        status, headers, body = catch(:async) {
          APP.call(@env.merge!(RACK_DEFAULTS))
        }
        if @hp.hijacked?
          ; # do nothing
        elsif nil == status || -1 == status
          @deferred = true
        else
          @deferred = nil
          ev_write_response(status, headers, body, @hp.next?)
        end
      # Never ever crash any thread
      rescue Exception => e
        if handler = EM.instance_variable_get(:@error_handler)
          handler.call(e)
        end
        handle_error(e)
      end
    end
  end
end
