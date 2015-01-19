NSIG = Signal.list.values.max + 1

def SIGBAD signo
  signo <= 0 || signo >= NSIG
end

def sigaddset(sigset, signo)
  if SIGBAD(signo) > 0
    raise Errno::EINVAL
  end
  sigset |= (1 << (signo - 1))
  return 0
end

def sigdelset(sigset, signo)
  if SIGBAD(signo) > 0
    raise Errno::EINVAL
  end
  sigset &= ~(1 << (signo - 1))
  return 0
end

def sigismember(set, signo)
  if SIGBAD(signo) > 0
    raise Errno::EINVAL
  end
  return set & (1 << (signo - 1) != 0)
end
