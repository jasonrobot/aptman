# Operations - Represents an operation available to aptman

require "./argument.cr"

class Operation

  property name : String


  def initialize(@name : String, @desc : String)
  end

  def is_valid_arg(arg : Argument)
  end

  def run
  end

end
