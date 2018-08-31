class Action

  property short_arg : String,
           long_arg : String

  setter payload : String

  def initialize(@short_arg : String, @long_arg : String, @payload = "")
  end

  def run
    print "running #{@payload}"
  end

end
