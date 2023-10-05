class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def select_opt
    option = gets.chomp.to_i

    actions = {
      1 => method(:list_books),
      2 => method(:list_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals),
      7 => method(:exit)
    }

    action = actions[option]
    if action
      action.call
    else
      handle_invalid_option
    end
  end

  def list_books
    display_items(@books, 'Books', 'Title: %s, Author: %s')
  end

  def list_people
    display_items(@people, 'People', '[%s] Name: %s, ID: %d, Age: %d')
  end

  def create_book
    title = input_string('Title:')
    author = input_string('Author:')
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_person
    type = input_option('Create a Student (1) or Teacher (2)?', [1, 2])
    age = input_integer('Age:')
    name = input_string('Name:')

    case type
    when 1
      parent_permission = input_boolean('Has parent permission? (y/n):')
      @people << Student.new(age, name, parent_permission: parent_permission)
    when 2
      specialization = input_string('Specialization:')
      @people << Teacher.new(age, specialization, name)
    end

    puts 'Person created successfully'
  end

  def create_rental
    book = select_from_list(@books, 'Select a book:')
    person = select_from_list(@people, 'Select a person:')
    date = input_string('Date:')
    @rentals << Rental.new(date, person, book)
    puts 'Rental created successfully'
  end

  def list_rentals
    id = input_integer('Enter the ID of the person:')
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id
    end
  end

  # Helper methods here...
end
