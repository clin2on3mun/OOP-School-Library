require 'json'
require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'message'
require_relative 'inputs'
require_relative 'preserve_data'

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
  

  def create_student
    preserve_data = PreserveData.new
    age = @input.input_age
    person_name = @input.input_name
    permission = @input.parent_permission
    person = Student.new(age, person, parent_permission: permission)
    preserve_data.create_student_data(person,1)
  end

  def create_teacher
    preserve_data = PreserveData.new
    age = @input.input_age
    person_name = @input.input_name
    specialization =@input.input_specialization
    person = Teacher.new(age, specialization, person)
    preserve_data.create_teacher_data(person, 2)
  end
  def check_person
    res = read_from_file("../people.json")
    if !res.nil? && res.class != Array
      @persons.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @person = res
    end
  end
  def create_a_person
    num_choice = @input.input_person_status
    person_data = nil
    if num_choice == 1
       person_data = create_student
    elsif num_choice == 2
       person_data = create_teacher
    end
    check_person
    @persons.push(person_data)
    write_to_file("../people.json", @persons)
    @message.successful('Person')
    $stdout.flush
  end
  # create book
  def create_a_book
    book_title = @input.input_book_title
    book_author = @input.input_book_author
    res = read_from_file("books.json")
    if !res.nil? && res.class != Array
      @books.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @books = res
    end
    @books << Book.new(book_author, book_title)
    write_to_file("books.json", @books)
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
  def read_from_file(file_name)
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end
  def write_to_file(file_name, items)
    data = items.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file_name, json)
  end
end
