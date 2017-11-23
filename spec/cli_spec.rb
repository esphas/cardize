# frozen_string_literal: true
require 'rake'

RSpec.describe 'Cardize CLI' do

  context 'run with no arguments' do
    it 'should display help message' do
      Rake::Task[:test].invoke
    end
  end

end
