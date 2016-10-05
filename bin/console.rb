

do loop
 puts "Welcome to the Flatiron School Information System:"
 for Course.all.each_with_index do |course, index|
   puts "(#{index}) #{course}"
 end
 puts "(A) Add Course\n(Q) Quit"
 input = gets.chomp
 if input.to_i == input
   Course[i].print_info


end
