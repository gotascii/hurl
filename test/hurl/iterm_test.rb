require File.dirname(__FILE__) + '/../test_helper.rb'

class ITermTest < Test::Unit::TestCase

  def setup
    @appscript = stub_everything
    @app = stub(:current_terminal => @appscript)
    Appscript.stubs(:app).returns(@app)
  end

  def test_appscript_should_be_Terminal
    Appscript.expects(:app).with('iTerm').returns(@app)
    assert_equal @appscript, ITerm.new('dir').appscript
  end

  def test_appscript_should_be_current_terminal
    app = stub(:current_terminal => 'ct')
    Appscript.stubs(:app).with('iTerm').returns(app)
    assert_equal 'ct', ITerm.new('dir').appscript    
  end
  
  def test_project_dir_should_be_initialized
    assert_equal 'dir', ITerm.new('dir').project_dir
  end
  
  def test_create_tab_yields_new_session
    @appscript.stubs(:sessions).returns(stub(:last => 'last'))
    ITermSession.expects(:new).with('last').returns('s')
    t = ITerm.new('dir')
    t.create_tab do |tab|
      assert_equal 's', tab
    end
  end

  def test_this_tab_yields_new_session
    @appscript.stubs(:current_session).returns('cs')
    ITermSession.expects(:new).with('cs').returns('s')
    t = ITerm.new('dir')
    t.this_tab do |tab|
      assert_equal 's', tab
    end
  end
end