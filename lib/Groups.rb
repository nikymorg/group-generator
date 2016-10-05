class Group

  @@all = []

  attr_accessor :students, :instructor, :course

  def initialize(students:, course: )
    @students = students
    @course = course
    @@all << self
  end

  def print_info(index)
    puts "Group #{index + 1}: "
    puts "Instructor: #{@instructor.name}"
    puts "-----------\n"
    puts "Students: "
    students.each do |student|
      puts student.name
    end
    nil
  end

  def self.all
    @@all
  end
end
