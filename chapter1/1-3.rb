while true
  c = STDIN.getc
  break if c.nil?
  STDOUT.putc(c)
end
