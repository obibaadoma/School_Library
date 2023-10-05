class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    self.book = book # Use the setter method
    self.person = person # Use the setter method
  end

  def book=(new_book)
    @book = new_book
    new_book.rentals << self if new_book # Add the rental to the book's rentals
  end

  def person=(new_person)
    @person = new_person
    new_person.rentals << self if new_person # Add the rental to the person's rentals
  end
end
