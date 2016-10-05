class Course
  @@all = []

  attr_accessor :name, :students, :instructors, :group_size, :used_combos, :current_groups

  def initialize(name:, student_names: [], instructor_names: [])
    @name = name
    @students = []
    @instructors = []
    @used_combos= []
    @current_instructor = 0
    self.add_student_by_array(student_names)
    self.add_instructor_by_array(instructor_names)
    @@all << self
  end

  def self.all
    @@all
  end

  def add_student_by_name(name)
    @students << Student.new(name: name, course: self)
    @students.shuffle!
  end

  def add_student_by_array(array)
    array.each do |student|
      add_student_by_name(student)
    end
  end

  def add_instructor_by_name(name)
    @instructors << Instructor.new(name: name, course: self)
  end

  def add_instructor_by_array(array)
    array.each do |instructor|
      add_instructor_by_name(instructor)
    end
  end

  def remove_by_name(name)
    @instructors.each {|instructor| if instructor.name == name then @instructors.delete(instructor) end}
    @students.each {|student| if student.name == name then @students.delete(student) end}
  end

  def has_individual(name)
    @instructors.include?(name) || @students.include?(name)
  end


  def create_group(group_size: 3)
    @current_groups = []
    @group_size = group_size
    ungrouped_students = self.students
    combos = self.students.combination(@group_size).to_a.shuffle
    while ungrouped_students.size >= @group_size
      new_group = combos.find {|combo|(combo - ungrouped_students).empty? && !used_combos.include?(combo)}
      @current_groups << Group.new(students: new_group, course: self)
      assign_instructor
      ungrouped_students -= new_group
    end
    distrib_leftovers(ungrouped_students)
    remove_used_combos
  end

  def assign_instructor
    @current_groups.last.instructor = @instructors[@current_instructor]
    @current_instructor == instructors.size-1 ? @current_instructor = 0 : @current_instructor += 1
  end


  def distrib_leftovers(ungrouped_students)
    case @group_size
    when 4
      @current_groups.each do |group|
        break if ungrouped_students.size==3
        ungrouped_students<< group.students.pop
      end
      @current_groups << Group.new(students: ungrouped_students, course: self)
      assign_instructor
      ungrouped_students = []
    when 3, 2
      ungrouped_students.size.times do |count|
        @current_groups[count].students << ungrouped_students.shift
      # @current_groups.each {|group| group.students << ungrouped_students.shift}
      end
    end
end

def remove_used_combos
  @current_groups.each {|group| used_combos << group.students}
end

def print_groups
  current_groups.each_with_index do |group, index|
    group.print_info(index)
    puts "\n"
  end
  nil
end

def print_info
  puts "Course: #{self.name}\n------"
  puts "Instructors: \n-----------"
  @instructors.each {|instructor| puts " - #{instructor.name}"}
  puts "\nStudents: \n--------"
  @students.each {|student| puts " - #{student.name}"}
  nil
end

end
