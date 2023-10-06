# Student class represents a student with classroom information.
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, parent_permission: true, classroom: nil)
    super(id, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
