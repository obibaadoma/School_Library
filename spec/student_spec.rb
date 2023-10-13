require_relative '../student'
require_relative '../person'

describe Student do
  before(:each) do
    @student = Student.new(18, 'Lucca', classroom: 'Class A', parent_permission: true)
  end

  context 'When testing the Student class' do
    it 'The name must contain: Lucca' do
      expect(@student.name).to include 'Lucca'
    end

    it 'The play_hooky option must contain: ¯(ツ)/¯' do
      expect(@student.play_hooky).to eq '¯(ツ)/¯'
    end
  end
end
