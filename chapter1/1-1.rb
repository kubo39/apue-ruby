abort("usage: ls directory home") if ARGV.size != 1

Dir.open(ARGV.shift).each do |entry|
  puts entry
end
