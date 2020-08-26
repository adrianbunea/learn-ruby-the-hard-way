def loopNumbers(iterations)
  numbers = []
  
  for i in (0..iterations)
    puts "At the top i is #{i}"
    numbers.push(i)

    puts "Numbers now: #{numbers}"
    puts "At the bottom i is #{i}"
  end

  return numbers
end


iterations = 5
numbers = loopNumbers(iterations)

puts "The numbers: "

for num in numbers
  puts num
end