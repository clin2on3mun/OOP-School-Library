require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'message'
require_relative 'inputs'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
    @message = Messages.new
    @input = Inputs.new
  end

  # list all books
  def list__all_books
    @message.info_messages('books') if @books.empty?
    @books.each { |book| puts "title : #{book.title} by author : #{book.author}" }
  end

  def list_all_persons
    @message.info_messages('People') if @persons.empty?
    @persons.each do |person|
      if person.instance_of?(Teacher)
        puts "[Teacher]Age: #{person.age} Name: #{person.name}, ID: #{person.id}"
      else
        puts "[Student]Age: #{person.age},Name: #{person.name}, ID: #{person.id} "
      end
    end
  end

  # create person
  def create_a_person
    is_student = @input.input_person_status
    age = @input.input_age
    person_name = @input.input_name
    case is_student

    when 1
      permission = @input.parent_permission
      create_student(age, person_name, permission)
    when 2
      create_teacher(age, person_name)
    end
    @message.successful('Person')
    $stdout.flush
  end

  def create_student(age, person, permission)
    persons << Student.new(age, person, parent_permission: permission)
  end

  def create_teacher(age, person)
    @persons << Teacher.new(age, specialization, person)
  end

  # create book
  def create_a_book
    book_title = @input.input_book_title
    book_author = @input.input_book_author
    @books << Book.new(book_author, book_title)
    @message.successful('Book')
    $stdout.flush
  end

  # create rental
  def create_a_rental
    @message.rental_error(@books) if @books.empty? || persons.empty?

    book_index = @input.find_book_by_idx(@books)
    select_book = @books[book_index]
    person_index = @input.find_person_by_idx(@persons)
    select_person = @persons[person_index]

    date = @input.input_date
    @rentals.push(Rental.new(date, select_book, select_person))
    @smessage.successful('Rental')
    $stdout.flush
  end

  # list_all_rentals
  def list_of_rentals
    @message.rental_error(@books) if @rentals.empty?
    input_person_id = @input.show_rental(@rentals)
    puts 'Rentals'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}" if rental.person.id == input_person_id
    end
  end
end
