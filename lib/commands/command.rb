# frozen_string_literal: true

class Cardize::Command

  DisabledCommandCalled = 'Disabled command were called!'

  DefaultDirectory = '.'

  attr_reader :name
  attr_reader :description
  attr_reader :switches
  attr_reader :options

  def initialize
    @name = :base
    @description = 'Command Base'
    @switches = []
    @options = {
      enabled: false
    }
  end

  def enabled?
    @options[:enabled]
  end

  def run options
    raise DisabledCommandCalled unless enabled?
    @options.merge! options
  end
end
