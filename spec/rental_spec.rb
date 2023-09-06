require_relative '../lib/rental'

expected_hash = {
  date: '2023-09-06',
  book: {
    title: 'Atomic Habits',
    author: 'James Clear'
  },
  person: {
    name: 'Munana',
    age: 34,
    specialization: 'Finance'
  }
}
describe Rental do
  context 'Test for Rental Object' do
    before :each do
      person = double('Person')
      allow(person).to receive(:name) { 'Munana' }
      allow(person).to receive(:age) { 34 }
      allow(person).to receive(:specialization) { 'Finance' }
      allow(person).to receive(:to_hash).and_return({ name: 'Munana', age: 34, specialization: 'Finance' })

      book = double('Book')
      allow(book).to receive(:title) { 'Atomic Habits' }
      allow(book).to receive(:author) { 'James Clear' }
      allow(book).to receive(:to_hash) {
                       { title: 'Atomic Habits', author: 'James Clear' }
                     } # Specify behavior for to_hash

      @rental = Rental.new('2023-09-06', book, person)
    end

    it 'checks for instance of Rental' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'returns a hash representation' do
      expect(@rental.to_hash).to eq(expected_hash)
    end
  end
end
