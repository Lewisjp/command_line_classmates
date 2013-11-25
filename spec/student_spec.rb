require_relative '../lib/student'

describe Student do
	let(:student) {Student.new("http://flatironschool-bk.herokuapp.com")}

	describe "#name" do
			it "Should include the student names" do
			expect(Student.name).to include("Jeremy Lewis")
		end
	end

	describe "#twitter" do

			it "Should include the student twitter" do
			expect(Student.twitter).to include("@LewisJPaul")
		end
	end

	describe "#blog" do

			it "Should incude the student blog" do
			expect(Student.blog).to include("http://sleepydinosuar.tumblr.com/")
		end
	end

	describe "#get_github" do

			it "Should incude the student blog" do
			expect(Student.get_github).to include("mrsnickers")
		end
	end


end