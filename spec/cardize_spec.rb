# frozen_string_literal: true

RSpec.describe Cardize do

  let :cardize { described_class.new }

  describe '#run' do
    it 'should be able to run' do
      expect(cardize).to respond_to(:run)
    end

    it 'should run with command and optional options' do
      expect{ cardize.run }.to raise_error(ArgumentError)
      expect{ cardize.run :help }.not_to raise_error
      expect{ cardize.run :help, optkey: 'value' }.not_to raise_error
    end
  end

end
