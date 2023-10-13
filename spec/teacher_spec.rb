require_relative '../teacher'
require_relative '../person'

describe Teacher do
  before(:all) do
    @teacher = Teacher.new('Engineer', 60, 'Obiba')
  end

  context 'When testing the Teacher class' do
    it 'The name must contain: Obiba' do
      expect(@teacher.name).to eq 'Obiba'
    end
  end

  context 'When testing the teacher class' do
    it 'The can_use_services method must be true' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
