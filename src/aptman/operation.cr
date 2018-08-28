# Operations - Represents an operation available to aptman

require "./action.cr"

# Operation represents operations that can be done by the command
#
# An operation is composed of actions, which represent actual work done by the program.
#
class Operation

  property name : String

  @actions : Array(Action)

  def initialize(@name : String, @desc : String)
    @actions = Array(Action).new
  end

  def add_action(action : Action)
    @actions << action
  end

  def has_action?(arg : String)
    @actions.any? { |action| action.short_arg == arg || action.long_arg == arg }
  end

  def run
  end

end
