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
    print 'Do you want to add a student (1) or a teacher (2)? [Insert the number]: '
    is_student = gets.chomp.strip.to_i
    print 'Age: '
    age = @input.number_inputs
    print 'Name: '
    person_name = @input.string_inputs
    case is_student

    when 1
      puts 'Has Parent Permission [Y/N]'
      permission = gets.chomp.downcase == 'y'
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
    puts 'Specialization'
    specialization = gets.chomp
    @persons << Teacher.new(age, specialization, person)
  end

  # create book
  # The bug was introduced on this method create_book
  def create_a_book
    print 'Title: '
    book_title = @input.string_inputs
    print 'Author: '
    book_author = @input.string_inputs
    @books << Book.new(book_author, book_title)
    @message.successful('Book')
    $stdout.flush
  end

  # create rental
  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = @input.number_inputs
    select_book = @books[book_index]
    print 'Select a person from the following list by number (not ID)'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = @input.number_inputs
    select_person = @persons[person_index]
    print 'Enter Rental Date (yyyy-mm-dd)'
    date = gets.chomp
    @rentals.push(Rental.new(date, select_book, select_person))
    @smessage.successful('Rental')
    $stdout.flush
  end

  # list_all_rentals
  def list_of_rentals
    print 'ID of person'
    input_person_id = @input.number_inputs
    puts 'Rentals'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}" if rental.person.id == input_person_id
    end
  end
end
