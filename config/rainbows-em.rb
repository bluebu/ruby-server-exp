
worker_processes 4
timeout 30

Rainbows! do
  use :EventMachine
  if defined?(Zbatery)
    worker_connections      256*4
  else
    worker_connections      256
  end

  client_max_body_size      5*1024*1024 # 5 megabytes
  client_header_buffer_size 8*1024      # 8 kilobytes
end
