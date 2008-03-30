require File.dirname(__FILE__) + '/../test_helper.rb'

class TerminalTest < Test::Unit::TestCase

  def setup
    @appscript = stub_everything
    @app = stub(:windows => stub(:[] => @appscript))
    Appscript.stubs(:app).returns(@app)
  end

  def test_appscript_should_be_Terminal
    Appscript.expects(:app).with('Terminal').returns(@app)
    assert_equal @appscript, Terminal.new('dir').appscript
  end

  def test_appscript_should_be_window_zero
    windows = mock
    windows.expects(:[]).with(0).returns('window')
    app = stub(:windows => windows)
    Appscript.stubs(:app).with('Terminal').returns(app)
    assert_equal 'window', Terminal.new('dir').appscript    
  end
  
  def test_project_dir_should_be_initialized
    assert_equal 'dir', Terminal.new('dir').project_dir
  end
  
  def test_create_tab_should_activate_appscript
    t = Terminal.new('dir')
    @appscript.expects(:activate)
    Appscript.stubs(:app).returns(stub_everything)
    t.create_tab
  end

  def test_create_tab_should_use_system_to_keystroke_t
    t = Terminal.new('dir')
    keystroke = mock
    keystroke.expects(:keystroke).with("t", :using => :command_down)
    Appscript.expects(:app).with('System Events').returns(keystroke)
    t.create_tab
  end

  def test_this_tab_should_activate_appscript
    t = Terminal.new('dir')
    @appscript.expects(:activate)
    Appscript.stubs(:app).returns(stub_everything)
    t.this_tab
  end
  
  def test_create_tab_yields_new_session
    t = Terminal.new('dir')
    keystroke = stub
    keystroke.stubs(:keystroke).with("t", :using => :command_down)
    Appscript.stubs(:app).with('System Events').returns(keystroke)
    @appscript.stubs(:tabs).returns(stub(:last => 'last'))
    TerminalSession.expects(:new).with('last').returns('s')
    t.create_tab do |tab|
      assert_equal 's', tab
    end
  end

  def test_this_tab_yields_new_session
    t = Terminal.new('dir')
    @appscript.stubs(:tabs).returns(stub(:first => 'last'))
    TerminalSession.expects(:new).with('last').returns('s')
    t.this_tab do |tab|
      assert_equal 's', tab
    end
  end
end