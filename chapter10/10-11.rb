require './posixsignal'

# can't reset SIGQUIT
trap("QUIT") {
  puts "caught SIGQUIT"
}

newmask = Signal::Sigset.new
Signal.sigemptyset(newmask)
Signal.sigaddset(newmask, Signal.list["QUIT"])

oldmask = Signal::Sigset.new
Signal.sigprocmask(Signl::SIG_BLOCK, newmask, oldmask)

sleep 5

pendmask = Signal::Sigset.new
Signal.sigpending(pendmask)
if Signal.sigismember(pendmask, Signal.list["QUIT"]) > 0
  puts "\nSIGQUIT pending"
end

Signal.sigprocmask(Signal::SIG_SETMASK, oldmask, nil)
puts "SIGQUIT unblocked"

sleep 5
