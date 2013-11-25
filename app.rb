require './lib/scraper.rb'
#require './lib/*'
require 'launchy'

class App

	def initialize 
		@student_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com")

		@names = student_scraper.get_student_names
		@twitter = student_scraper.get_twitter_names
		@blogs = student_scraper.get_blog_websites
		@gits = student_scraper.get_github

		@students = Array.new
		28.times do |i|
			students << Student.new(names[i],twitters[i],blogs[i])
		end
		students
	end

	def random_git
		num = gits.length
		the_git = gits[rand(num)]
		Launchy.open("http://https://github.com/#{the_git}")
	end

	def random_blog
		num = blogs.length
		the_blog = blogs[rand(num)]
		Launchy.open("the_blog")
	end

	def random_twitter
		num = twitter.length
		the_twitter = twitter[rand(num)]
		Launchy.open("the_twitter")
	end

	def display_students
		puts names
		select_student
	end


	def student_profile(profile)
		arr_index = 0
		names.each | student |
			if student == profile
				arr_index = names.index("profile")
			end
		end
		puts "#{profile}\nTwitter: #{twitter[arr_index]}\nBlog: #{blogs[arr_index]}"
		class_contents
	end


	def select_student
		puts "Enter 1 for student list, or enter the student's full name."
		select_student_answer = gets.chomp.to_s.downcase
		case select_student_answer
		when "1" then display_students

		else
			student_profile(select_student_answer)
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
		when 6 then break
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
open_book.random_git