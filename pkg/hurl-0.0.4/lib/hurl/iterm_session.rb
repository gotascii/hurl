class ITermSession < Session
  def hurl(cmd)
    session.write(:text => cmd)
  end
end