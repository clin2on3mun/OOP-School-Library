require_relative 'rental'
class Book
  attr_accessor :author, :title, :rental

  def initialize(author, title)
    @author = author
    @title = title
    @rental = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
