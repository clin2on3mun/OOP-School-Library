require_relative '../lib/trim_decorator'

describe TrimmerDecorator do
  context 'Test for capitalize decorator object' do
    let(:nameable) { double('Nameable', correct_name: 'Jack') }
    let(:trimmer_decorator) { TrimmerDecorator.new(nameable) }

    it 'should return the a captilized name' do
      expect(trimmer_decorator.correct_name).to eq('Jack')
    end
  end
end
