require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'person'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  # list all books
  def list__all_books
    puts 'List of books'
    @books.each { |book| puts "title : #{book.title} by author : #{book.author}" }
  end

  def list_all_persons
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
    age = gets.chomp.to_i
    print 'Name: '
    person_name = gets.chomp
    case is_student

    when 1
      puts 'Has Parent Permission [Y/N]'
      permission = gets.chomp.downcase == 'y'
      create_student(age, person_name, permission)
    when 2
      create_teacher(age, person_name)
    end
    puts 'Person added successfully'
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
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp
    @books << Book.new(book_author, book_title)
    puts 'Book added successfully'
    $stdout.flush
  end

  # create rental
  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    select_book = @books[book_index]
    print 'Select a person from the following list by number (not ID)'
    @persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    select_person = @persons[person_index]
    print 'Enter Rental Date (yyyy-mm-dd)'
    date = gets.chomp
    @rentals.push(Rental.new(date, select_book, select_person))
    puts 'rental added successfully'
    $stdout.flush
  end

  # list_all_rentals
  def list_of_rentals
    print 'ID of person'
    input_person_id = gets.chomp.to_i
    puts 'Rentals'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}" if rental.person.id == input_person_id
    end
  end

  def render_choices
    puts 'Please Choose an Option by entering a number:'
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals for a given person id.'
    puts '7. EXIT'
  end

  def choose_number(choice)
    case choice
    when 1
      list__all_books
    when 2
      list_all_persons
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_of_rentals
    end
  end

  def show
    loop do
      render_choices
      choice = gets.chomp.to_i
      if choice >= 7
        puts 'Thank you for using this app'
        break
      end
      choose_number(choice)
    end
  end
end
