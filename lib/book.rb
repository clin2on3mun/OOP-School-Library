require_relative 'rental'
class Book
  attr_accessor :author, :title, :rentals

  def initialize(author, title)
    @id =  Random.rand(1..1000),
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
  def to_hash
    {
      id: @id,
      title: @title,
      author: @author
    }
  end
end
