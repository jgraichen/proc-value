require 'spec_helper'

describe 'Proc::Value' do

  it 'should allow transparent usage of blocks' do
    option1 = 'path/to/file.rb'
    expect(option1.value.to_s).to be == 'path/to/file.rb'

    option2 = proc { 'path/to/file.rb' }
    expect(option2.value.to_s).to be == 'path/to/file.rb'

    option3 = lambda { 'path/to/file.rb' }
    expect(option3.value.to_s).to be == 'path/to/file.rb'
  end

  context 'Object' do
    let(:sample) { Object.new }
    subject { sample }

    it 'should have #value method' do
      expect(subject).to respond_to(:value)
    end

    context '#value' do
      subject { sample.value }

      it 'should return same object' do
        expect(subject).to be === subject
      end
    end
  end

  context 'Proc' do
    let(:sample) { Object.new }
    let(:block)  { proc { sample } }
    subject { block }

    it 'should have #value method' do
      expect(subject).to respond_to(:value)
    end

    context '#value' do
      subject { block.value }

      it 'should return block result' do
        expect(subject).to be === sample
      end
    end

    context '.val' do
      context 'with block' do
        subject { Proc.val(block) }

        it 'should evaluate block' do
          expect(subject).to be === sample
        end
      end

      context 'with object' do
        subject { Proc.val(sample) }

        it 'should evaluate block' do
          expect(subject).to be === sample
        end
      end
    end
  end
end
