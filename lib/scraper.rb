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
           	names = Array.new
 			all_the_h3s = @html.search("h3")  #with class and inspect you saw it starts as an array
           	all_the_h3s.each do |h3|
           		names << h3.text
            end
            names
# !! you can use .map or .collect  on line 24 insteadof each # they automatically create a new array and return it ,

        end


        def get_twitter_names
            t_names = Array.new

            all_the_twitters = html.search(".back").each do |i|  # <div class='face back'>
            	if i.search(".twitter").text.strip[0]=="@" 
            		# class='twitter'
            		# Returns a copy of str with leading and trailing whitespace removed.
            		# "    hello    ".strip   #=> "hello"
            		t_names << i.search(".twitter").text.strip 
            	else
            		t_names << "Does not Twitter."
            	end
            end
            t_names

        end


        def get_github
            all_the_gits = html.search("a").text.split(" ").reject! {|i| i == "Blog" || i.include?("@")} 
        end

        def get_blog_websites
	            blog_uri = Array.new
	       		html.search(".back").each do |blog_check|
		      	if blog_check.search("a.blog").text == "Blog"
		        	blog_uri << blog_check.search("a.blog")[0]["href"]
		     	else
		        	blog_uri << "none"
		      	end
		    end
		    blog_uri

        end




end


#gives us an object, - what kind?
 #my_scrapper = Scraper.new("http://flatironschool-bk.herokuapp.com") 
# puts my_scrapper.get_student_names.length
# puts my_scrapper.get_twitter_names.length
# puts my_scrapper.get_blog_websites.length
 #puts my_scrapper.get_github