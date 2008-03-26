class TerminalSession < Session
  def process(cmd)
    session.do_script(cmd, :in => session)
  end
end