class Nameable
  def initialize(name)
    @name = name
  end

  def correct_name
    @name
  end
end

class Decorator < Nameable
  def initialize(nameable, additional_info)
    super(nameable.correct_name)
    # Call super with the result of parent class's constructor
    @additional_info = additional_info
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
