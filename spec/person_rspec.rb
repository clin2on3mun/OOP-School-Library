require_relative '../lib/person'
require_relative '../lib/book'
describe Person do
    context "Test for person object" do
        let(:person) { Person.new(25,"Olla")}
        let (:book)  { Book.new("Paulo Coelho","The Alchemist")}
        let (:date) {'2023-09-06'}
        let (:rental){Rental.new(date, book, person)}
        it "Should return the correct name of the person Olla" do
            expect(person.correct_name).to eq("Olla")
        end
        it "Should return the using can_use_service method" do
            expect(person.can_use_services?).to eq(true)
        end
        it "should return a rental object with the correct data" do
            expect(person.add_rental(book, date)) .to be_a(Rental)
        end
    end
end
