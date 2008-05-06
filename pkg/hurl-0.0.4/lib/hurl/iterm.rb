class ITerm < Project
  def initialize(dir)
    @appscript = Appscript.app('iTerm').current_terminal
    super(dir)
  end
  
  def create_tab
    @appscript.launch_(:session => "Default Session")
    yield ITermSession.new(@appscript.sessions.last) if block_given?
  end

  def this_tab
    yield ITermSession.new(@appscript.current_session) if block_given?
  end
end