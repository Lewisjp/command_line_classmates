require './lib/scraper.rb'
require './lib/student.rb'
require 'launchy'

class App

	attr_accessor :names, :twitter, :blogs, :gits

	def initialize 
		student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com")

		@names = student_scraper.get_student_names
		@twitter = student_scraper.get_twitter_names
		@blogs = student_scraper.get_blog_websites
		@gits = student_scraper.get_github

		@students = Array.new
		28.times do |i|
			@students << Student.new(names[i],twitter[i],blogs[i])
		end
		@students
	end

	def random_git
		num = gits.length
		the_git = gits[rand(num)]
		Launchy.open("https://github.com/#{the_git}")

		class_contents
	end

	def random_blog
		num = blogs.length
		the_blog = blogs[rand(num)]
		Launchy.open("#{the_blog}")

		class_contents
	end

	def random_twitter
		num = twitter.length
		the_twitter = twitter[rand(num)]
		Launchy.open("https://twitter.com/#{the_twitter.delete "@"}")

		class_contents
	end

	def display_students
		puts names
		select_student
	end


	def student_profile(select_student_answer)
		location = names.index("#{select_student_answer}")
		puts "\n  Twitter: #{twitter[location]}\n  Blog: #{blogs[location]}\n\n"

		done_now = gets.chomp
		class_contents
	end

	# needs to make interface more flexible 
	def select_student
		puts "Enter 1 for student list, or enter the student's full name.\n To return to the main menu enter 'back'"
		select_student_answer = gets.chomp.to_s
		case select_student_answer
		when "1" then display_students
		when "back" then class_contents
		when "Back" then class_contents
		when "BACK" then class_contents
		else
			if names.include?("#{select_student_answer}")
				student_profile(select_student_answer)
			else
				select_student
			end
		end

	end


	def class_contents_choice
		answer = gets.chomp.to_i
		case answer
		when 1 then welcome_message 
		when 2 then select_student
		when 3 then random_git
		when 4 then random_twitter
		when 5 then random_blog
		when 6 then puts "Have a good day."
		else
			class_contents
		end

	end


	def class_contents
		puts "Please enter the page number you'd like to see"
		puts "1. Welcome message"
		puts "2. Student profile"
		puts "3. Random Github"
		puts "4. Random Twitter page"
		puts "5. Random blog"
		puts "6. Exit Year Book"
		class_contents_choice
	end


	def welcome_message 
		puts "Welcome to the Class Year Book for Flatiron Web Development Fellows, Winter 2013.\nThere are still pages to fill, but in the meanwhile you'll get to see the draft."
		class_contents
	end
end

open_book = App.new
open_book.welcome_message