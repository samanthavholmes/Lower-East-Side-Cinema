#Model validations, associations, and methods tested

require 'rails_helper'
describe Rating do
	let!(:rating) {Rating.create({stars: 1.0, review: "text"})}
	let!(:rating2) {Rating.create({})}
	let(:user) {User.create({first_name: "test", last_name: "test", email: "test@test.com", password: "password", role: "judge"}) }
	let!(:film) {Film.create({title: "Title", director: "Director", description: "Description", picture: "picture.jpg"})}
	let!(:comment) {Comment.create({body: "Body"})}
	context "Validations" do

		describe "#stars" do
			it "is valid with a star rating as a float" do
				rating.valid?
				expect(rating.stars).to_not be_nil
			end

			it "is invalid without a star rating as a float" do
				rating2.valid?
				expect(rating2.stars).to be_nil
			end
		end
	end

	context "Associations" do

		describe "#rating.user" do
			it "returns a user if it has one" do
				user.ratings << rating
				expect(rating.user).to eq(user)
			end
		end

		describe "#rating.user" do
			it "returns nil if it has none" do
				expect(rating.user).to eq(nil)
			end
		end

		describe "#rating.film" do
			it "returns nil if it has none" do
				film.ratings << rating
				expect(rating.film).to eq(film)
			end
		end

		describe "#rating.film" do
			it "returns nil if it has none" do
				expect(rating.film).to eq(nil)
			end
		end

		describe "#rating.comments" do
			it "returns nil if it has none" do
				rating.comments << comment
				expect(rating.comments).to_not be_empty
			end
		end

		describe "#rating.comments" do
			it "returns nil if it has none" do
				expect(rating.comments).to be_empty
			end
		end

	end
end
