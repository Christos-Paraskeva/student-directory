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
    students << {name: name, cohort: :November, hobbies: :Sport, country: :England, height: :'5ft10' }
    puts "Now we have #{students.count} students".center(80)
    # get another name from user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The Students of Villains Academy".center(90)
  puts "--------------------------------".center(90)
end

def print_students(students)
  counter = 0
  while (counter < 1)
    students.each_with_index { |student, i| puts "#{i+1}. #{student[:name]} (Cohort: #{student[:cohort]}) (Hobbies: #{student[:hobbies]}) (Height: #{student[:height]}) (Country of Birth: #{student[:country]})".center(80) }
    counter += 1
  end
end
# this method seems to throw up an error after printing out the names correctly.
# def print_students(students)
#   counter = 0
#   students_counter = students.count
#   while (counter <= students_counter)
#     puts "#{counter+1}. #{students[counter][:name]}"
#     counter += 1
#   end
# end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(90)
end

def print_filtered_name_start(students)
  puts "Would you like to filter by name? (A-Z) "
  puts "Press 'Enter' to skip"
  # print "<< "
  view_names = gets.chomp
  
  if (view_names.empty? == false)
    puts "This is a list of students whos names begins with '#{view_names.upcase}'".center(90)
    puts "-----------------------------------------------------".center(90)
    students.each_with_index do |student, i|
      if (student[:name].start_with? view_names.downcase, view_names.upcase) 
        puts "#{i+1}. #{student[:name]} (Cohort: #{student[:cohort]}) (Hobbies: #{student[:hobbies]}) (Height: #{student[:height]}) (Country of Birth: #{student[:country]})".center(80)
      end
    end  
  end
end

def print_filtered_name_length(students)
  puts ""
  puts "Students with a name with a shorter length than 12 characters".center(90)
  puts "-------------------------------------------------------------".center(90)
  students.each_with_index do |student, i|
    if (student[:name].length < 12)
      puts "#{i+1}. #{student[:name]} (Cohort: #{student[:cohort]}) (Hobbies: #{student[:hobbies]}) (Height: #{student[:height]}) (Country of Birth: #{student[:country]})".center(80)
    else
      puts "Sorry, there are no names of that size!"
      exit
    end
  end
end

# def print_filtered_name_length(students)
#   puts "Would you like to filter the list based on the length of the name?"
#   puts "If so, then please enter the max length the name can be?"
#   puts "Otherwise, press 'Enter' to exit"
#   length = gets.chomp.to_i
#   students.each_with_index do |student, i|
#     if (student[:name].length <= length)
#       puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     else
#       puts "Sorry, there are no names of that size!"
#       exit
#     end
#   end
# end
# nothing happens until we call the methods
# students = input_students
students = input_students
print_header
print_students(students)
print_footer(students)
print_filtered_name_start(students)
print_filtered_name_length(students)