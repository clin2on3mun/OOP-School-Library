class Inputs
  def input_person_status
    print 'Do you want to add a student (1) or a teacher (2)? [Insert the number]: '
    gets.chomp.to_i
  end

  def input_age
    print 'Age: '
    gets.chomp.to_i
  end

  def input_name
    print 'Name: '
    gets.chomp
  end

  def input_specialization
    puts 'Specialization'
    gets.chomp
  end

  def input_book_title
    print 'Title: '
    gets.chomp
  end

  def input_book_author
    print 'Author: '
    gets.chomp
  end

  def parent_permission
    print 'Has Parent Permission [Y/N]: '
    permission = gets.chomp
    if permission.downcase == 'y'
      true
    elsif permission.downcase == 'n'
      false
    else
      'wrong input'
    end
  end

  def find_book_by_idx(books)
    print 'Select a book from the following list by number: '
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def find_person_by_idx(persons)
    print 'Select a person from the following list by number (not ID): '
    persons.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name} ID: #{person.id} Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def show_rental(rentals)
    print 'ID of person'
    person_id = gets.chomp.to_i
    rentals.select { |rental| rental.person.id == person_id }
  end
end
