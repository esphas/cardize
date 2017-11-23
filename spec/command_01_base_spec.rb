# frozen_string_literal: true

RSpec.describe Cardize::Command do

  let :cmd  { described_class.new }

  describe '::new' do
    it 'should accept no arguments as options' do
      expect{ cmd }.not_to raise_error
    end
  end

  describe '#options' do
    it 'should have some options as a Hash' do
      expect(cmd).to have_attributes(options: Hash)
    end
  end

  describe '#enabled?' do
    it 'should be disabled by default' do
      expect(cmd).to_not be_enabled
    end
  end

  let :options { {} }

  describe '#run' do
    it 'should be able to run' do
      expect(cmd).to respond_to(:run)
    end

    context 'when command is enabled and options are given' do
      it 'should run successfully' do
        allow(cmd).to receive(:enabled?).and_return(true)
        expect{ cmd.run options }.not_to raise_error
      end
    end

    context 'when command is enabled and no options are given' do
      it 'should raise an error' do
        allow(cmd).to receive(:enabled?).and_return(true)
        expect{ cmd.run }.to raise_error(ArgumentError)
      end
    end

    context 'when command is disabled' do
      it 'should raise an error' do
        allow(cmd).to receive(:enabled?).and_return(false)
        expect{ cmd.run options }.to raise_error(RuntimeError)
      end
    end
  end

  describe '#name' do
    it 'should have a name' do
      expect(cmd).to have_attributes(name: Symbol)
    end
  end

  describe '#description' do
    it 'should have a description' do
      expect(cmd).to have_attributes(description: String)
    end
  end

  describe '#switches' do
    it 'should have an array of strings as switches' do
      expect(cmd).to have_attributes(switches: Array)
      cmd.switches.each do |switch|
        expect(switch).to be_a(String)
      end
    end
  end

end
