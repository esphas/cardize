# frozen_string_literal: true

RSpec.describe Cardize::Command::Help do

  let :cmd { described_class.new }

  describe '#enabled?' do
    it 'should be enabled' do
      expect(cmd).to be_enabled
    end
  end

  let :options { {} }

  describe '#run' do
    it 'should display help messages' do
      expect{ cmd.run options }.to output.to_stdout
    end
  end

end
