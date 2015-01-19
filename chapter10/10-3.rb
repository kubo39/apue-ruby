# -*- coding: utf-8 -*-

# シグナルハンドラを再設定する必要はない
trap("SIGCLD") {
  puts "SIGCLD received"
  pid, status = Process.wait
  puts "pid=#{pid}"
}

fork do
  sleep 2
  exit!
end

sleep 3 # waiting signal
exit
