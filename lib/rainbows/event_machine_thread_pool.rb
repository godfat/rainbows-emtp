
require 'rainbows'

module Rainbows::EventMachineThreadPool
  autoload :Client, 'rainbows/event_machine_thread_pool/client'
  extend  Rainbows::PoolSize
  include Rainbows::EventMachine

  def init_worker_process worker
    EM.threadpool_size = Rainbows::O[:pool_size]
    super
  end
end
