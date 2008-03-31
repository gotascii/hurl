$:.unshift File.dirname(__FILE__)

require 'appscript'
require 'hurl/project'
require 'hurl/session'
require 'hurl/iterm_session'
require 'hurl/terminal_session'
require 'hurl/terminal'
require 'hurl/iterm'

module Hurl
  VERSION = '0.0.3'

  attr_accessor :dir

  def using(klass)
    @wrapper = klass.new(@dir)
  end

  def create_tab(&block)
    @wrapper.create_tab(&block)
  end

  def this_tab(&block)
    @wrapper.this_tab(&block)
  end
end