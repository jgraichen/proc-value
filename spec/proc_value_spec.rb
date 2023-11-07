# frozen_string_literal: true

require 'spec_helper'

describe 'Proc::Value' do
  it 'allows transparent usage of blocks' do
    option1 = 'path/to/file.rb'
    expect(option1.value.to_s).to be == 'path/to/file.rb'

    option2 = proc { 'path/to/file.rb' }
    expect(option2.value.to_s).to be == 'path/to/file.rb'

    option3 = -> { 'path/to/file.rb' }
    expect(option3.value.to_s).to be == 'path/to/file.rb'
  end

  describe 'Object' do
    subject(:sample) { Object.new }

    it 'has #value method' do
      expect(sample).to respond_to(:value)
    end

    describe '#value' do
      it 'returns same object' do
        expect(sample.value).to be sample
      end
    end
  end

  describe 'Proc' do
    subject(:block) { proc { sample } }

    let(:sample) { Object.new }

    it 'has #value method' do
      expect(block).to respond_to(:value)
    end

    describe '#value' do
      subject { block.value }

      it 'returns block result' do
        expect(block.value).to be sample
      end
    end

    describe '.val' do
      context 'with block' do
        subject(:val) { Proc.val(block) }

        it 'evaluates block' do
          expect(val).to be sample
        end
      end

      context 'with object' do
        subject(:val) { Proc.val(sample) }

        it 'evaluates block' do
          expect(val).to be sample
        end
      end
    end
  end
end
