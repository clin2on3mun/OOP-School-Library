class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    # Initialize book rentals array if it's nil
    book[:rental] ||= []
    book[:rental] << self

    @person = person

    # Initialize person rentals array if it's nil
    person[:rental] ||= []
    person[:rental] << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end
end
