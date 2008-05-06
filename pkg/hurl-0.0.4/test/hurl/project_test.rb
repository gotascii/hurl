require File.dirname(__FILE__) + '/../test_helper.rb'

class ProjectTest < Test::Unit::TestCase

  def setup
    @project = Project.new('special_dir')
  end

  def test_project_dir_should_be_initializable
    assert_equal 'special_dir', @project.dir
  end

  def test_should_have_project_dir_accessor
    @project.dir = 'dir'
    assert_equal 'dir', @project.dir
  end

  def test_should_have_appscript_accessor
    @project.appscript = 'scrip'
    assert_equal 'scrip', @project.appscript
  end
end
