# My very own options parser to emulate pacman

class Mode
  property name : Char,
           description : String

    def initialize(@name : Char, @description : String)
    end
end

class Parser

  def initialize(@args : Array(String))
  end

  @@modes : Array(Mode) = [
    Mode.new('S', "Sync"),
    Mode.new('R', "Remove"),
    Mode.new('Q', "Query"),
  ]

  def get_mode() : Mode?
    dash_args = @args.select { |arg| arg.starts_with? '-' }
                .map { |arg| arg[1] }
    # see if any args indicate a mode
    @@modes.find do |mode|
      # get the first char of each arg that starts with dash
      puts dash_args
      puts mode.name
      is_in = dash_args.includes? mode.name
      puts is_in
      is_in
    end
  end

  def get_operations()
  end

  def get_arguments()
  end

end
