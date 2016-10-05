require 'pry'

class Group

  @@all = []

  attr_accessor :students, :instructor, :course

  def initialize(students:, course: )
    @students = students
    @course = course
    @@all << self
  end

  def print_info(index)
    puts "Group #{index + 1}: Instructor, #{@instructor.name}"
    print "Students: " + students.map {|student| student.name}.sort.join(", ") +"\n\n"
  end

  def self.all
    @@all
  end
end
