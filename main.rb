require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def print_question
    puts "Please choose an option by entering a number:
      1- List all books.
      2- List all people.
      3- Create a person.
      4- Create a book.
      5- Create a rental.
      6- List all rentals for a given person id.
      7- Exit."
  end

  def run
    puts 'Welcome to the library Application!'
    loop do
      print_question
      selected_option = @app.select_opt
      break if selected_option == 7
    end
    puts 'Thanks for using this App!!'
  end
end

Main.new.run
