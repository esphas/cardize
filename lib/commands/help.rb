# frozen_string_literal: true

class Cardize::Command::Help < Cardize::Command

  def initialize
    super
    @name = :help
    @options[:enabled] = true
  end

  def run options
    super
    # require 'optparse'
    puts @options[:opts].inspect
  end

end
