require File.dirname(__FILE__) + '/../test_helper.rb'

class ITermSessionTest < Test::Unit::TestCase

  def setup
    @session = stub("session")
    @iterm = ITermSession.new(@session)
  end

  def test_process_should_write_to_session
    @session.expects(:write).with(:text => "hey")
    @iterm.hurl("hey")
  end
end
