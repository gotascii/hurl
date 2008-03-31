class Session
  attr_reader :session

  def initialize(sesh)
    @session = sesh
  end

  def method_missing(command, *args)
    cmd = command.to_s + args.inject('') do |opts, arg| opts += ' ' + arg.to_s end
    hurl(cmd)
  end

  def hurl(cmd)
  end
end