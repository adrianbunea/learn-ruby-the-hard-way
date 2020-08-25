input_file = ARGV[0]

# defines a function that puts the whole read file
def print_all(f)
  puts f.read()
end

# defines a function that "rewinds" the file back
def rewind(f)
  f.seek(0, IO::SEEK_SET)
end

# defines a function that prints a single line from the file and the number
def print_a_line(line_count, f)
  puts "#{line_count} #{f.readline()}"
end

current_file = File.open(input_file)

puts "First let's print the whole file:"
puts # a blank line

# calls the first function
print_all(current_file)

puts "Now let's rewind, kind of like a tape."

# calls the second function
rewind(current_file)

puts "Let's print three lines:"

# creates a variable containing the current line to be read
current_line = 1
# calls the third function
print_a_line(current_line, current_file)

# increments the current line
current_line += 1
# calls the function again
print_a_line(current_line, current_file)

current_line += 1
print_a_line(current_line, current_file)