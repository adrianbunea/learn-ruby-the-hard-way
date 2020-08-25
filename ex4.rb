# 100 cars
cars = 100
# 4 free seats in each car
space_in_a_car = 4.0
# 30 drivers
drivers = 30
# 90 passengers
passengers = 90
# 70 driverless cars
cars_not_driven = cars - drivers
# 30 cars with a driver
cars_driven = drivers
# 120 total amount of people we can transport
carpool_capacity = cars_driven * space_in_a_car
# each car has to take around 3 passengers to transport all of them
average_passengers_per_car = passengers / cars_driven

puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} passengers to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."