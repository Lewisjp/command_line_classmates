# require_relative '../lib/*'
# require 'launchy'

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

end

