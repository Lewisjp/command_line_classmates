require 'open-uri' # open the file on the internet
require 'nokogiri' # used for @html = Nokogiri::HTML(download) to interpret the contents of the url 


class Scraper

	attr_reader :html # so you can view the data

	def initialize(url)
		download = open(url)  # goes to the site and grabs stuff to be stored in download
		# Nokogiri is a class, here we're going insite it as if it was a folder # no @ because we're not saving it
		@html = Nokogiri::HTML(download) # translates the html so ruby can understand it, @ beccause we're saving it 
	end


	def get_student_names
		#location of the student names 
#		@html = html.search("h3")  #could use an instance variable #here h3 gets all the names 
#		all_the_h3s = @html.search("h3") #variable stores search results
#		all_the_h3s.text # returns the varaible with the text method on it # you can reformat the string elsewhere 
		students = html.search("div.face.front h3").to_s().split("</h3>").each {|x| x.slice!(0..3) }
	end


	def get_twitter_names
		t_names = Array.new
		#location of the student names 
#		@html = html.search("h3")  #could use an instance variable #here h3 gets all the names 
		all_the_twitters = @html.search(".social") #variable stores search results
		all_the_twitters.text.split(" ").each { |i| t_names << i if i.start_with?("@") } # returns the varaible with the text method on it # you can reformat the string elsewhere 
		t_names
#  .each do { |i| t_names << i if i.start_with?("@") }
# TODO: comment out the all the methods 
	end

	def get_blog_websites
		blog_uri = Array.new
		#location of the student names 
#		@html = html.search("h3")  #could use an instance variable #here h3 gets all the names 
		all_the_blogs = @html.search("a.blog") #variable stores search results
		# => <a class="blog" href="http://lewisjp.blog.com/" target="_blank">Blog</a> #etc 
# 		all_the_blogs.class  #=> Nokogiri::XML::NodeSet
		blog_uri = all_the_blogs.to_s().split(" ").select { |x| blog_uri << x if x.include?("href")}
		blog_uri.each {|x| x.slice!(0..4) }  #removes the "href from each element
	end


end


#gives us an object, - what kind?
my_scrapper = Scraper.new("http://flatironschool-bk.herokuapp.com") 
puts my_scrapper.get_student_names.inspect #calls the method get_student_names from the scrapper that has data
my_scrapper.get_blog_websites
my_scrapper.get_twitter_names
# when ran in cmd line, it'll pause because its downloading from the site