# Class containing data about a person
require_relative 'nameable'
require './rental'

class Person < nameable
  # Fixed the class name to inherit from Nameable (capitalized)
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super() # Call the superclass constructor with no arguments
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end
end
