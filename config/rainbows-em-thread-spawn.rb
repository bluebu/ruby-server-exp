
worker_processes 4
timeout 30

Rainbows! do
  use :EventMachine, :em_client_class => lambda{
    RainbowsEventMachineThreadSpawnClient
  }
  if defined?(Zbatery)
    worker_connections      16*4
  else
    worker_connections      16
  end

  client_max_body_size      5*1024*1024 # 5 megabytes
  client_header_buffer_size 8*1024      # 8 kilobytes
end

after_fork{ |_, _|
  class RainbowsEventMachineThreadSpawnClient < Rainbows::EventMachine::Client
    def app_call input
      Thread.new{ super }
    end
  end
}
