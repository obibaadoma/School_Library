class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super() # Call super to initialize the parent class (Nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    original_name.length > 10 ? original_name[0, 10] : original_name
  end
end
