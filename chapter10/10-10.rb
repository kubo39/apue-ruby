require 'ffi'

class SigprocmaskError < SystemCallError; end

class Sigset < FFI::Struct
  layout :__val, :ulong
end

module SignalExt
  extend FFI::Library
  ffi_lib 'libc.so.6'
  attach_function :sigprocmask, [:int, :pointer, :pointer], :int
  attach_function :sigismember, [:pointer, :int], :int
end


def pr_mask str
  sigset = Sigset.new
  if SignalExt.sigprocmask(0, nil, sigset) < 0
    raise SigprocmaskError
  end

  print str
  print " INT"  if SignalExt.sigismember(sigset, Signal.list["INT"])
  print " QUIT" if SignalExt.sigismember(sigset, Signal.list["QUIT"])
  print " USR1" if SignalExt.sigismember(sigset, Signal.list["USR1"])
  print " ALRM" if SignalExt.sigismember(sigset, Signal.list["ALRM"])
  print "\n"
end
