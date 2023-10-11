require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'unknown', id = nil)
    id ||= Random.rand(1..188)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self unless classroom.nil?
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom.students.delete(self)
    @classroom = classroom
    classroom.students.push(self)
  end

  def to_hash
    {
      'id' => @id,
      'type' => 'Student',
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
  end
end
