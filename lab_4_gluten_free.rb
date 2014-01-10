# Lab 4: A Gluten Free Hellscape

require "pry"

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

# What I need to do:
# assign 2 arg inputs, stomach & allergy status (what about names, Chris and Beth?)
# a person has to eat; make a method to eat
# if the food is one they're allergic to, eject food from stomach and raise error

class AllergyError < Exception
end

class Person
	# attr_accessor :allergies is the equivalent of writing setter and getter methods
		# initialize @allergies following this
	attr_accessor :allergies

	def initialize(allergies)
		@allergies = allergies
		@stomach = [] # per the instructions, "A person will have a stomach and allergies"
	end

	def eat(food)
		begin
			if food.include?(@allergies)
				puts "#{food.join(", ")} are really tasty (if you're not allergic)!"
				@stomach = [] #push food out of stomach?
				raise AllergyError.new("This food makes me sick!")
			else
				puts "Yum!"
				@stomach << food
			end
		rescue AllergyError => err
			puts err
		end
	end

	# def error(allergies)
	# 	raise AllergyError, "This food makes me sick!" if @allergies == true
	# end
end

# class AllergyError < ArgumentError; end
# begin
# 	raise AllergyError.new("This food makes me sick!")
# rescue AllergyError => err
# 	puts "There was an allergy issue here
# end"

chris = Person.new("gluten")
chris.eat(water)