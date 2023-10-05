class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Method to add a student to the classroom
  def add_student(student)
    student.classroom = self
    @students << student
  end
end
end
