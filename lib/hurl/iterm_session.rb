class ITermSession < Session
  def process(cmd)
    session.write(:text => cmd)
  end
end