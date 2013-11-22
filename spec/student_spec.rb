require_relative '../lib/*'

describe Student do

	describe "#name" do

			it "Should include the student names" do
			expect(Student.name).to include?("Jeremy Lewis")
		end
	end

	describe "#twitter" do

			it "Should include the student twitter" do
			expect(Student.twitter).to inlude?("@LewisJPaul")
		end
	end

	describe "#blog" do

			it "Should incude the student blog" do
			expet(Student.blog)to. include?("http://sleepydinosuar.tumblr.com/")
		end
	end

end