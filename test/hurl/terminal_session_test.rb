require File.dirname(__FILE__) + '/../test_helper.rb'

class TerminalSessionTest < Test::Unit::TestCase

  def setup
    @session = stub("session")
    @terminal = TerminalSession.new(@session)
  end

  def test_process_should_do_script_with_cmd_in_session
    @session.expects(:do_script).with("hey", :in => @session)
    @terminal.process("hey")
  end
end
