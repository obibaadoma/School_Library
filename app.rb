require_relative 'student'
require_relative 'teacher'
require_relative 'person'
require_relative 'book'
require_relative 'rental'

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_s
    "Title: #{@title}, Author: #{@author}"
  end
end

class Person
  attr_reader :id, :name, :age

  @id_counter = 0

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = @id_counter += 1
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_s
    "Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end

class Student < Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end
end

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    @specialization = specialization
    super(age, name, parent_permission: parent_permission)
  end

  def can_use_services?
    true
  end
end

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end
end

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def select_opt
    option = gets.chomp.to_i

    actions = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals,
      7 => :exit
    }

    action = actions[option]
    action ? send(action) : handle_invalid_option
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

  def check_number(msg)
    number = 0
    loop do
      print msg
      input = gets.chomp.to_i
      if input.is_a?(Integer) && input.positive?
        number = input
        break
      else
        puts 'Please, enter a valid input!'
      end
    end
    number
  end

  def check_options(msg, options)
    number = 0
    loop do
      print msg
      input = gets.chomp.to_i
      if options.include?(input)
        number = input
        break
      else
        puts 'Please, enter a valid input!'
      end
    end
    number
  end

  def create_person
    num = choose_person_type

    age = input_integer('Age:')
    name = input_string('Name:')

    case num
    when 1
      parent_permission = input_boolean('Has parent permission? [y/n]:')
      create_student(age, name, parent_permission)
    when 2
      specialization = input_string('Specialization:')
      create_teacher(age, specialization, name)
    else
      puts 'Invalid number, please enter a valid option (1 for Student, 2 for Teacher).'
    end
  end

  def choose_person_type
    input_option('Do you want to create a student (1) or a teacher (2)? [Input the number]: ', [1, 2])
  end

  def create_student(age, name, parent_permission)
    @people << Student.new(age, name, parent_permission: parent_permission)
    puts 'Student created successfully'
  end

  def create_teacher(age, specialization, name)
    @people << Teacher.new(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def create_rental
    puts 'Select a book from the following list'
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    book_num = gets.chomp.to_i

    puts 'Select a person from the following list'
    @people.each_with_index do |per, index|
      puts "No: #{index + 1}, [#{per.class}] Name: #{per.name}, ID: #{per.id}, Age: #{per.age}"
    end
    person_num = gets.chomp.to_i

    print 'Date:'
    date = gets.chomp

    @rentals << Rental.new(date, @people[person_num - 1], @books[book_num - 1])
    puts 'Rental Created successfully'
  end

  def list_rentals
    print 'Kindly enter the ID of the person:'
    id_person = gets.chomp
    id_person = id_person.to_i

    puts 'Rentals'
    @rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == id_person
    end
  end

  def main
    loop do
      puts 'Options:'
      puts '1. List books'
      puts '2. List people'
      puts '3. Create person'
      puts '4. Create book'
      puts '5. Create rental'
      puts '6. List rentals'
      puts '7. Exit'
      select_opt
    end
  end

  def display_items(items, title, format)
    puts title
    items.each do |item|
      puts format % item
    end
  end

  def input_string(prompt)
    print "#{prompt} "
    gets.chomp
  end

  def input_integer(prompt)
    loop do
      print "#{prompt} "
      input = gets.chomp.to_i
      return input if input.positive?

      puts 'Please enter a valid positive integer.'
    end
  end

  def input_boolean(prompt)
    loop do
      print "#{prompt} "
      input = gets.chomp.downcase
      return true if input == 'y'
      return false if input == 'n'

      puts 'Please enter "y" for yes or "n" for no.'
    end
  end

  def input_option(prompt, options)
    loop do
      print "#{prompt} "
      input = gets.chomp.to_i
      return input if options.include?(input)

      puts 'Please enter a valid option.'
    end
  end

  def select_from_list(list, prompt)
    loop do
      puts prompt
      list.each_with_index { |item, index| puts "#{index + 1}. #{item}" }
      input = gets.chomp.to_i
      return list[input - 1] if (1..list.length).cover?(input)

      puts 'Please select a valid option.'
    end
  end

  def handle_invalid_option
    puts 'Invalid option. Please try again.'
  end
end
