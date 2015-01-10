require 'ffi'

module Unistd
  extend FFI::Library
  ffi_lib 'libc.so.6'
  attach_function :alarm, [:uint], :uint
  attach_function :pause, [], :int
end

def sleep1 seconds
  trap("ALRM"){|signo|
    # nop
  }
  Unistd.alarm seconds
  Unistd.pause
  Unistd.alarm 0
end

if __FILE__ == $0
  sleep1 2
end
