$:.unshift File.dirname(__FILE__)

require 'appscript'
require 'hurl/project'
require 'hurl/session'
require 'hurl/iterm_session'
require 'hurl/terminal_session'
require 'hurl/terminal'
require 'hurl/iterm'

module Hurl
  attr_accessor :project_dir

  def using(klass)
    @wrapper = klass.new(@project_dir)
  end

  def create_tab(&block)
    @wrapper.create_tab(&block)
  end

  def this_tab(&block)
    @wrapper.this_tab(&block)
  end
end