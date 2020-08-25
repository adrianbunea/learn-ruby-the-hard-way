# defines a function with two parameters
def cheese_and_crackers(cheese_count, boxes_of_crackers)
  # puts a string interpolated with the first parameter
  puts "You have #{cheese_count} cheeses!"
  # puts a string interpolated with the second parameter
  puts "You have #{boxes_of_crackers} boxes of crackers!"
  # puts a string
  puts "Man that's enough for a party!"
  # puts a string
  puts "Get a blanket."
  puts # a blank line
end

# puts a string
puts "We can just give the function numbers directly:"
# calls the function with two hardcoded numbers
cheese_and_crackers(20, 30)

# puts a string
puts "OR, we can use variables from our script:"
# creates a variable containing a number
amount_of_cheese = 10
# creates another variable containing a number
amount_of_crackers = 50
# calls the function with the created variables as parameters
cheese_and_crackers(amount_of_cheese, amount_of_crackers)

# puts a string
puts "We can even do math inside too:"
# calls the function with 2 math calculations as variables
cheese_and_crackers(10 + 20, 5 + 6)

# puts a string
puts "And we can combine the two, variables and math:"
# calls the function with the variables and math operations as parameters
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)

def my_function(arg1, arg2, arg3)
  print "arguments: #{arg1}, #{arg2}, #{arg3}\n"
end

arg1, arg2, arg3 = [10, "Hello World!", false]

my_function(1, 2, 3)
my_function(1 + 2, 3.0 / 4, 5 + 6)
my_function(arg1, arg2, arg3)
my_function(arg1 + 1, arg2 + arg2, !arg3)
my_function(arg1, arg2, false)
my_function(arg3, arg1, arg2)
my_function(arg1, arg2 * 10, arg3)
my_function('1' + arg2, arg2, arg3)
my_function([10, "Hello World!", false] ,arg2, arg3)
my_function(1, false, false)
my_function([10, "Hello World!", false], [10, "Hello World!", false],[10, "Hello World!", false])