require_relative 'person'

class Student < Person
  def initialize(classroom, age, name = 'unknown')
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
