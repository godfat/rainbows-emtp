
require 'rainbows'

module Rainbows::EventMachineThreadPool
  autoload :Client, 'rainbows/event_machine_thread_pool/client'
  extend  Rainbows::PoolSize
  include Rainbows::EventMachine

  def init_worker_process worker
    EM.threadpool_size = Rainbows::O[:pool_size]
    super
  end

  def worker_loop worker
    build_app!
    server = Rainbows.server
    server.app = Rainbows::ThreadTimeout.new(server.app,
                   :timeout => server.config.set[:timeout])
    super
  end
end
