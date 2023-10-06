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
