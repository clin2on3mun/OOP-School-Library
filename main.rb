require_relative 'app'

# class Show
#   def initialize(app)
#     @app = app
#   end

#   def choose_number(app, choice)
#     case choice
#     when 1
#       app.list__all_books
#     when 2
#       app.list_all_persons
#     when 3
#       app.create_a_person
#     when 4
#       app.create_a_book
#     when 5
#       app.create_a_rental
#     when 6
#       app.list_of_rentals
#     when 7
#       puts 'Good bye'
#     end
#   end

#   def start
#     loop do
#       render_choices
#       choice = gets.chomp.to_i
#       break if choice == 7

#       choose_number(@app, choice)
#     end
#   end
# end

def main
  app = App.new
  app.show
end

main
