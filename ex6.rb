# Creates a string that interpolates the number 10
x = "There are #{10} types of people."
# Creates a variable binary that contains the string 'binary'
binary = "binary"
# Creates a variable do_not that contains the string "don't"
do_not = "don't"
# Creates a string that interpolats the two variables created earlier
y = "Those who know #{binary} and those who #{do_not}."

# Prints the x variable
puts x
# Prints the y variable
puts y

# Prints a string that interpolates x
puts "I said: #{x}."
# Prints a string that interpolates y
puts "I also said: '#{y}'."

# Creates a boolean variable that is false
hilarious = false
# Creates a string that interpolates the hilarious variable
joke_evaluation = "Isn't that joke so funny? #{hilarious}"

# Prints the variable joke_evaluation
puts joke_evaluation

# Creates a string
w = "This is the left side of..."
# Creates another string
e = "a string with a right side."

# Prints the two strings next to each other
puts w + e