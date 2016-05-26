require 'rails_helper'
describe Film do
	let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	# let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg", ratings: [1, 2, 3, 4, 5]})}
	let!(:film2) {Film.create({})}

	context "Validations" do

		describe "#title" do		
		it "is valid with a title" do
				film.valid?
				expect(film.title).to eq("Title")
			end
		
		it "is invalid without a title" do
				film2.valid?
				expect(film2.title).to be_nil
			end
		end

		describe "#director" do 
			it "is valid with a director" do
				film.valid?
				expect(film.director).to eq("Director")
			end

			it "is invalid without a director" do
				film2.valid?
				expect(film2.director).to be_nil
			end
		end

		describe "#description" do
			it "is valid with a director" do
				film.valid?
				expect(film.description).to eq("Description")
			end

			it "is invalid without a director" do
				film2.valid?
				expect(film2.director).to be_nil
			end
		end

		describe "#picture" do
			it "is valid with a picture" do
				film.valid?
				expect(film.picture).to eq("picture.jpg")
			end

			it "is invalid without a picture" do
				film2.valid?
				expect(film2.picture).to be_nil
			end
		end
	end

	# context "Methods" do
	# 	describe "#average_star_rating" do
	# 		it "calculates the average star ratings given to film" do
	# 		end
	# 		end
	# end
end