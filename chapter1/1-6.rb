begin
  File.open("unknown")
rescue => e1
  begin
    raise Errno::EACCES
  rescue => e2
    puts "#{e2.inspect} #{e2.message}"
  end
  puts "#{e1.inspect} #{e1.message}"
end
