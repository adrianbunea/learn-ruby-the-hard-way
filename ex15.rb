# gets the first argument passed to the script and assigns it to a variable
filename = ARGV.first

# creates the prompt character in a variable
prompt = "> "
# opens the file named as the filename
txt = File.open(filename)

# puts a string interpolated with the file name
puts "Here's your file: #{filename}"
# puts the text read from the opened file
puts txt.read()
puts txt.close()

# puts a string with instructions
puts "I'll also ask you to type it again:"
# puts the prompt variable
print prompt
# gets the name of the text file from user input
file_again = STDIN.gets.chomp()

# opens the file again using the input name
txt_again = File.open(file_again)

# puts the text from the file opened again
puts txt_again.read()
puts txt_again.close()