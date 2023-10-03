# This class inherits from the Person class and adds a specialization attribute.
# Teachers can use services.

require_relative 'person'
# Teacher class represents a teacher with a specialization.
class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, specialization, parent_permission: true)
    super(id, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
