require_relative '../lib/capitalize_decorator'

describe CapitalizeDecorator do
  context 'Test for capitalize decorator object' do
    let(:nameable) { double('Nameable', correct_name: 'jack') }
    let(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

    it 'should return the a captilized name' do
      expect(capitalize_decorator.correct_name).to eq('Jack')
    end
  end
end
