class City
  include Comparable
  attr_accessor :name, :population

  def <=>(other_city)
    @population <=> other_city.population
  end
end

NUM_CITIES = 5

cities = NUM_CITIES.times.map do |i|
  city = City.new
  print "Enter the name of city #{i + 1}: "
  city.name = gets.chomp
  print "Enter the population of #{city.name}: "
  city.population = gets.chomp.to_i
  city
end

puts "The most populous city is: #{cities.sort.last.name}"
