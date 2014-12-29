Signal.trap(:INT) do
  print "interrupt\n% "
end

while true
  print "% "
  buf = STDIN.gets
  break if buf.nil?
  pid = spawn(buf)
  Process.waitpid pid
end
