# My very own options parser to emulate pacman

require "./operation.cr"

# Parser for command line args to aptman
# This is mean to emulate how pacman works on Arch Linux
class Parser

  param banner : String

  def initialize(@args : Array(String))

  end

  def add_operation(op : Operation)
    @operations << op
  end

  # Make the array of command line args into an array of strings of args without dashes
  def explode_args() : Array(String)
    @args.map do |arg|
      # if single dash
      if arg =~ /^-[^-]/
        # return the parts
        arg[1, arg.size].chars.map &.to_s
      elsif arg =~ /^--[^-]/
        # if double dash
        # return the arg without leading double dashes
        arg[2, arg.size]
      else
        # otherwise, this is a target arg, remove it
      end
    end.flatten.compact
  end

  # Get the target names/patterns/files for the command
  def get_targets
    @args.select { |arg| !arg.starts_with? '-' }
  end

end
