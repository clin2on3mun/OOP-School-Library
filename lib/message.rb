class Messages
  def successful(message)
    puts "#{message} added successfully!"
  end

  def info_messages(message)
    puts "The list of #{message} is empty"
  end

  def rental_error(books)
    if books.empty?
      puts 'no books available'
    else
      puts 'no person available'
    end
  end
end
