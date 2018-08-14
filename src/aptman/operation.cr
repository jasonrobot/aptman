# Operations - Represents an operation available to aptman

require "./argument.cr"

class Operation

  property name : Char,
           args : Array(Argument)


  def initialize
  end

  def is_valid_arg(arg : Argument)
  end

  def run
  end

end
