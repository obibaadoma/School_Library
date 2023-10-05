# Student class represents a student with classroom information.
class Student < Person
  def initialize(id, age, parent_permission: true, classroom: nil)
    super(id, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    attr_reader :classroom

    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
