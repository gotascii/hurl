require File.dirname(__FILE__) + '/../test_helper.rb'

class SessionTest < Test::Unit::TestCase

  def setup
    @session = Session.new('sesh')
  end

  def test_session_should_be_initializable
    assert_equal 'sesh', @session.session
  end

  def test_should_call_exec_on_session_for_missing_methods
    @session.expects(:hurl).with('glock pop')
    @session.glock 'pop'
  end
end
