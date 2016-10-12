#!/usr/bin/env ruby
require 'pry'

require_relative 'config/environment.rb'

def welcome
  system 'clear'
  do_welcome = true
  while do_welcome == true
    puts "Welcome to the Flatiron School Information System:"
    Course.all.each_with_index do |course, index|
      puts "(#{index + 1}) #{course.name}"
    end
    puts "(Q) Quit"
    input = gets.chomp.upcase
    #while input != "Q" && input != "A"
    until input == "A" || input == "Q" || (input.to_i > 0 && input.to_i <= Course.all.size)
      puts "Please input a valid response (Q, A, Course ID)!"
      input = gets.chomp
    end
    if input == "A"
      #Add a course
    elsif input == "Q"
      do_welcome = false
    else
      course(input)
    end
  end
end

def course(input)
  system 'clear'
  do_course = true
  current_course = Course.all[input.to_i - 1]
  while do_course == true
    puts "----------"
    if input.to_i != 0
      puts "(C) Class"
      if current_course.current_groups then puts "(V) View Groups" end
      puts "(G) Generate Groups\n(S) Students\n(I) Instructors\n(E) Edit People\n(B) Back"
      input2 = gets.chomp.upcase
      system 'clear'
      case input2
       when "C"
         current_course.print_info
       when "V"
         current_course.print_groups
       when "G"
         puts "Group Size?"
         input3 = gets.chomp.to_i
         current_course.create_group(group_size: input3)
         current_course.print_groups
       when "I"
         puts "Instructors: #{current_course.instructors.size}"
         puts current_course.instructors.map {|instructor| instructor.name}.sort.join(", ")
       when "S"
         puts "Students: #{current_course.students.size}"
         puts current_course.students.map {|student| student.name}.sort.join(", ")
       when "B"
         do_course = false
       when "E"
         edit_course(current_course)
       end
    end
  end
end

def edit_course(course)
  system 'clear'
  results = ""
  do_edit=true
  while do_edit==true
    puts results
    puts "Edit People: \n(1) Add Instructor\n(2) Add Student\n(3) Remove Person\n(B) Back"
    input2 = gets.chomp.upcase
    system 'clear'
    if input2 == "1" || input2 == "2" || input2 == "3"
      puts "Enter the name of your new, changed, or deleted person"
      input3 = gets.chomp
    end
    case input2
      when "1"
        course.add_instructor_by_name(input3)
        results = "Instructors: "+course.instructors.map {|instructor| instructor.name}.sort.join(", ")
      when "2"
        course.add_student_by_name(input3)
        results = "Students: \n - "+course.students.map {|student| student.name}.sort.join(", ")
      when "3"
        course.remove_by_name(input3)
        results = "Removed #{input3}"
      when "B"
        results = ""
        do_edit = false
    end
  end
end

welcome
