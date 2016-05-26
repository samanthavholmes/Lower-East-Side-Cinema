require 'rails_helper'
describe Film do
	# let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	let!(:film2) {Film.create({})}
	let(:rating){Rating.create({stars: 1})}
	let(:rating2){Rating.create({stars: 2})}

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
	# 	describe "#film.avg_star_rating" do
	# 		it "calculates the average star rating given to film" do
	# 			film.ratings.push(rating, rating2)
	# 			total = film.ratings.first.stars + film.ratings.second.stars
	# 			average = total/film.ratings.length
	# 			expect(film.avg_star_rating).to eq(3.0)
	# 		end
	# 		end
	# end
end