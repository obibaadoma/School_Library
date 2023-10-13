require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(60, 'Lucia', parent_permission: true)
  end

  context 'When testing the Person class' do
    it 'The name must contain: Lucia' do
      expect(@person.name).to include 'Lucia'
    end

    it 'The age must be: 60' do
      expect(@person.age).to eq 60
    end

    it 'The parent permission must be: true' do
      expect(@person.parent_permission).to be true
    end
  end
end
