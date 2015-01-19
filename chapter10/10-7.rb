require 'ffi'

module Unistd
  extend FFI::Library
  ffi_lib 'libc.so.6'
  attach_function :alarm, [:uint], :uint
end

trap("ALRM") {}
Unistd.alarm 10

line = STDIN.readline
Unistd.alarm 0
puts line
