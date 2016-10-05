class Student
  @@all = []

  attr_accessor :name, :course, :group

  def initialize(name:, course:)
    @name = name
    @course = course
    @@all << self
  end

  def self.all
    @@all
  end

end
