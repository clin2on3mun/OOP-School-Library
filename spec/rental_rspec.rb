require_relative '../lib/rental'

describe Rental do
  context 'Test for Rental Object' do
    before :each do
      person = double('Person')
      allow(person).to receive(:name) { 'Munana' }
      allow(person).to receive(:age) { 34 }
      allow(person).to receive(:specialzation) { 'Finance' }

      book = double('Book')
      allow(book).to receive(:title) { 'Atomic Habits' }
      allow(book).to receive(:author) { 'James Clear' }

      @rental = Rental.new('2023-09-06', book, person)
    end
    it 'check for instance of Rental' do
      expect(@rental).to be_an_instance_of(Rental)
    end
  end
end
