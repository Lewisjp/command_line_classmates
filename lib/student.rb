require_relative '../lib/*'

class Student 

	attr_accessor :name, :twitter, :blog 

	def initialize(name, twitter, blog)
		@name = name
		@twitter = twitter
		@blog = blog 

	end

	def all_data
		all_data = Array.new
		all_data << name << twitter << blog
		all_data
	end

	#assuming we have a value for each category for each student
	# def by_name_get_twitter


	# end

end