#Model validations, associations, and methods tested

require 'rails_helper'
describe Comment do
	let!(:rating) {Rating.create({stars: 1.0, review: "text"})}
	let!(:comment) {Comment.create({body: "Body"})}
	let!(:comment2) {Comment.create({})}
	let(:first_user) {User.create ({first_name: "test", last_name: "test", email: "test@test.com", password: "password", role: "judge"}) }
	context "Validations" do

		describe "#body" do
			it "is valid with a comment body" do
				comment.valid?
				expect(comment.body).to_not be_nil
			end

			it "is invalid without a comment body" do
				comment2.valid?
				expect(comment2.body).to be_nil
			end
		end
	end

	context "Associations" do

		describe "#comment.user" do
			it "returns the user who made the comment" do
				first_user.comments << comment
				expect(comment.user).to be(first_user)
			end

			it "returns nil if it does have a user" do
				expect(comment.user).to be_nil
			end
		end

		describe "#comment.rating" do
			it "returns the rating which was commented on" do
				rating.comments << comment
				expect(comment.rating).to be(rating)
			end

			it "returns nil if it is not connected to a rating" do
				expect(comment.rating).to be_nil
			end
		end
	end
end
