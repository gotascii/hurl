class Terminal < Project
  def initialize(dir)
    @appscript = Appscript.app('Terminal').windows[0]
    super(dir)
  end

  def create_tab
    @appscript.activate
    Appscript.app("System Events").keystroke("t", :using => :command_down)
    yield TerminalSession.new(@appscript.tabs.last) if block_given?
  end

  def this_tab
    @appscript.activate
    yield TerminalSession.new(@appscript.tabs.first) if block_given?
  end
end