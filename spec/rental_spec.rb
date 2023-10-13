require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before(:each) do
    @book = Book.new('Pinocho', 'Author')
    @person = Person.new(25, 'Abubakar', parent_permission: true)
    @rental = Rental.new('01-15-2023', @person, @book)
  end

  context 'When testing the Rental class' do
    it 'The date must be: 01-15-2023' do
      expect(@rental.date).to eq '01-15-2023'
    end

    it 'The name of the book on this rental must be: Pinocho' do
      expect(@rental.book.title).to eq 'Pinocho'
    end

    it 'The name of the person who rented the book must be: Abubakar' do
      expect(@rental.person.name).to eq 'Abubakar'
    end
  end
end
