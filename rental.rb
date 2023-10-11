class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(date, book, person, person_book_index)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    @person_book_index = person_book_index
    book.rentals << self
  end

  def to_hash
    {
      'date' => @date,
      'person' => @person.to_hash,
      'book' => @book.to_hash,
      'person_book_index' => @person_book_index
    }
  end
end
