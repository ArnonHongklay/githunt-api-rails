puts "in unicorn.rb"

worker_procs = ENV['UNICORN_WORKERS'] ? ENV['UNICORN_WORKERS'].to_i : 8

worker_processes worker_procs
timeout 28

preload_app true
listen ENV['PORT'] || 3010, tcp_nopush: false

# Throttle the master from forking too quickly by sleeping.
# before_fork { |_server, _worker| ConnectionChief.before_fork; sleep 1 }
# after_fork  { |_server, _worker| ConnectionChief.after_fork }
