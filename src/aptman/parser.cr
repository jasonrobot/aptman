# My very own options parser to emulate pacman

require "./operation.cr"
require "./argument.cr"

# Parser for command line args to aptman
# This is mean to emulate how pacman works on Arch Linux
class Parser

  @dash_args : Array(String)

  def initialize(@args : Array(String))
    @dash_args = @args.select { |arg| arg.starts_with? '-' }

    sync_ops = [
      Operation.new("s", "search"),
      Operation.new("y", "update"),
      Operation.new("yy", "force update"),
      Operation.new("u", "upgrade")
    ]

    remove_ops = [
      Operation.new("s", "and remove deps")
    ]

    query_ops = [
      Operation.new("l", "list files"),
      Operation.new("o", "owns <file>")
    ]

  end

  # Make the array of command line args into an array of strings of args without dashes
  def explode_args(args : Array(String))
    args.map do |arg|
      # if single dash
      if arg =~ /^-[^-]/
        # return the parts
        arg[1, arg.size]
      elsif arg =~ /^--[^-]/
        # if double dash
        # return the arg without leading double dashes
        arg[2, arg.size]
      else
        # otherwise, this is a target arg, remove it
        ""
      end
    end.flatten
  end

  # Get the major mode for the command. These correspond to a Mode object.
  def get_operation : Operation?
  end

  # Get any operations that apply to the current mode
  #
  # Need to look for any args that start with dash, then remove all chars that
  # are the mode's name.
  def get_operations_for_mode
  end

  # Get all non-operation non-mode arguments for the
  def get_arguments
  end

  # Get the target names/patterns/files for the command
  def get_targets
    @args.select { |arg| !arg.starts_with? '-' }
  end

end
