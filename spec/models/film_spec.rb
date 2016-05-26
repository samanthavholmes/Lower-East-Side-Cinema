require 'rails_helper'
describe Film do
	# let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	let!(:film2) {Film.create({})}
	let(:rating){Rating.create({stars: 1})}
	let(:rating2){Rating.create({stars: 2})}
	let(:genre){Genre.create({title: "title"})}
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

	context "Associations" do

		describe "#film.genre" do
			it "returns the genre it belongs to" do
				genre.films << film
				expect(film.genre).to eq(genre)
			end

			it "returns nil if it doesn't have a genre" do
				expect(film.genre).to be_nil
			end
		end

		describe "#film.rating" do
			it "returns an array of ratings if it has them" do
				film.ratings << rating
				film.ratings << rating2
				expect(film.ratings).to eq([rating, rating2])
			end

			it "returns an empty array if it has no ratings" do
				expect(film.ratings).to be_empty
			end
		end
	end



end
