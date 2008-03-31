class TerminalSession < Session
  def hurl(cmd)
    session.do_script(cmd, :in => session)
  end
end