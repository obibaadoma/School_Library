#!/usr/bin/env ruby

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
