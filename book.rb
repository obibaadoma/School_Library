require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
  def to_hash
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals.map { |rental| { 'date' => rental.date } }
    }
  end
end
