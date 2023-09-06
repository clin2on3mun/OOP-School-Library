require_relative '../lib/book'
require_relative '../lib/person'

describe Book do
  context 'Testing for book Object' do
    let(:book) { Book.new('Paulo coelho', 'The Alchemist') }
    let(:person) { Person.new(25, 'Olla') }
    let(:date) { '2023-09-06' }

    it 'should return the correct author' do
      expect(book.author).to eq('Paulo coelho')
    end
    it 'should return the correct title' do
      expect(book.title).to eq('The Alchemist')
    end
    it 'should return the Rental book' do
      expect(book.add_rental(person, date)).to be_a(Rental)
    end
  end
end
