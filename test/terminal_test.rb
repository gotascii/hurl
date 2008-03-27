require File.dirname(__FILE__) + '/test_helper.rb'

class TerminalTest < Test::Unit::TestCase

  def setup
    @appscript = stub
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
end