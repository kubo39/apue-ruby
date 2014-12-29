STDIN_FILNO = 0
STDOUT_FILENO = 1

BUFFSIZE = 4096

stdin_io = IO.new(STDIN_FILNO)
stdout_io = IO.new(STDOUT_FILENO)

while true
  buf = stdin_io.sysread(BUFFSIZE)
  stdout_io.syswrite(buf)
end
