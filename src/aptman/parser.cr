# My very own options parser to emulate pacman

class Operation

end

class Mode
  property name : Char,
           description : String,
           operations : Array(Operation)

  def initialize(@name, @description, @operations)
  end
end

class Parser

  def initialize(@args : Array(String))
    @dash_args = @args.select { |arg| arg.starts_with? '-' }
  end

  @@modes : Array(Mode) = [
    Mode.new('S', "Sync"),
    Mode.new('R', "Remove"),
    Mode.new('Q', "Query"),
  ]

  # Get the major mode for the command. These correspond to a Mode object.
  def get_mode() : Mode?
    # see if any args indicate a mode
    @@modes.find do |mode|
      # get the first char of each arg that starts with dash
      @dash_args.map { |arg| arg[1] }.includes? mode.name
    end
  end

  # Get any operations that apply to the current mode
  #
  # Need to look for any args that start with dash, then remove all chars that
  # are the mode's name.
  def get_operations_for_mode(mode : Mode)
    all_mode_ops = mode.operations
    # select the ops in the mode that are present in any dash arg
    all_mode_ops.select do |op|
      @dash_args.any? do |arg|
        arg.chars.includes? op.name
      end
    end
  end

  def get_arguments()
  end

end
