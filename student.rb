# Student class represents a student with classroom information.
class Student < Person
  attr_accessor :classroom

  def initialize(id, age, parent_permission: true, classroom: nil)
    super(id, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
