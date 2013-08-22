
require 'rainbows'

module Rainbows::EventMachineThreadPool
  include Rainbows::EventMachine

  def worker_loop worker
    server = Rainbows.server
    server.app = Rainbows::ThreadTimeout.new(server.app,
                   :timeout => server.config.set[:timeout])
    super
  end
end
