class Project
  attr_accessor :project_dir, :appscript

  def initialize(dir)
    @project_dir = dir
  end
end