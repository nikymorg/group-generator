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
    puts "Students: "
    to_print = students.map do |student|
      student.name
    end
    print to_print.join(", ")
    puts "\n-----------\n"
    nil
  end

  def self.all
    @@all
  end
end
