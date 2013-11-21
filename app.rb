#require './lib/scraper.rb'
require './lib/*'

student_scrapper = Scrapper.new(http://flatironschool-bk.herokuapp.com)

names = student_scrapper.get_student_names
twitters = student_scrapper.get_twitter_names
blogs = student_scrapper.get_blog_websites


students = Array.new
28.times do |i|
	students << Student.new(names[i],twitters[i],blogs[i])
end

#!!! redo  the above! its for the student class