class Book
  attr_reader :rental
  attr_accessor :author, :title

  def initialize(author, title)
    @author = author
    @title = title
    @rental = []
  end
end
