require_relative '../lib/decorator_class'

describe Decorator do
  context 'Test for decorator object' do
    let(:decorator) { Decorator.new('Jack') }
    it 'should return the correct name' do
      expect(decorator.nameable).to eq('Jack')
    end
    it 'should return the instance of Decorator' do
      expect(decorator).to be_an_instance_of(Decorator)
    end
  end
end
