class Instructor
  @@all = []

  attr_accessor :name, :course, :groups

  def initialize(name:, course:)
    @name = name
    @course  = course
    @groups = []
    @@all << self
  end

  def self.all
    @@all
  end
end
