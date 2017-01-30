def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index { |student, i| puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_filtered_name_start(students)
  puts "Would you like to filter by name? (A-Z) "
  puts "Press 'Enter' to skip"
  # print "<< "
  view_names = gets.chomp
  
  if (view_names.empty? == false)
    puts "This is a list of students whos names begins with '#{view_names.upcase}'"
    students.each_with_index do |student, i|
      if (student[:name].start_with? view_names.downcase, view_names.upcase) 
        puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
    end  
  end
end

def print_filtered_name_length(students)
  puts "Would you like to filter the list based on the length of the name?"
  puts "If so, then please enter the max length the name can be?"
  puts "Otherwise, press 'Enter' to exit"
  length = gets.chomp.to_i
  students.each_with_index do |student, i|
    if (student[:name].length <= length)
      puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
      puts "Sorry, there are no names of that size!"
      exit
    end
  end
end
# nothing happens until we call the methods
# students = input_students
students = input_students
print_header
print(students)
print_footer(students)
print_filtered_name_start(students)
print_filtered_name_length(students)