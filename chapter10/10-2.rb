# -*- coding: utf-8 -*-
require 'etc'
require 'ffi'

module Alarm
  extend FFI::Library
  ffi_lib 'libc.so.6'
  attach_function :alarm, [:uint], :uint
end

Signal.trap(:SIGALRM) {|signo|
  puts "in signal handler"
  Etc.getpwnam("root")
  Alarm.alarm(1)
}
Alarm.alarm(1)

# シグナルハンドラは
# シグナルを通知された時点で実行するのではなく通知後に
# バイトコード実行中に実行される
while true
  rec = Etc.getpwnam("kubo39")
  puts "return value corrupted!" if rec.name != "kubo39"
end
