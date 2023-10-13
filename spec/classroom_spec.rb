require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new
  end

  context 'When testing the Classroom class' do
    it 'The method add_student must add one student and shows the name' do
      student = Student.new(20, 'John Doe')
      @classroom.add_student(student)
      added_student = @classroom.students.first

      expect(@classroom.students.length).to eq 1
      expect(added_student.name).to eq 'John Doe'
    end
  end
end
