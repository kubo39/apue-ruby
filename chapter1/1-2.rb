STDIN_FILENO = 0
STDOUT_FILENO = 1

BUFFSIZE = 4096

stdin_io = IO.new(STDIN_FILENO)
stdout_io = IO.new(STDOUT_FILENO)

while true
  begin
    buf = stdin_io.sysread(BUFFSIZE)
  rescue EOFError
    break
  end
  break if buf.empty?
  stdout_io.syswrite(buf)
end
