# frozen_string_literal: true

require 'logger'

require_relative 'version'

class Cardize

  require_relative 'commands/command'
  class Command
    require_relative 'commands/help'
  end

  DuplicatedCommand = 'Duplicated command!'
  InvalidCommand    = 'Invalid command!'

  def initialize
    add_commands
  end

  def add_commands
    @commands = {}
    add_command Command::Help
  end

  def add_command command
    command = command.new
    key = command.name
    if @commands.key? key
      raise DuplicatedCommand
    end
    @commands[key] = command
  end

  def run key, options = {}
    unless @commands.key? key
      #raise InvalidCommand
      key = :help
    end
    @commands[key].run options
  end

end
