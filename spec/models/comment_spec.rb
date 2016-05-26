require 'rails_helper'
describe Comment do
	let!(:comment) {Comment.create({body: "Body"})}
	let!(:comment2) {Comment.create({})}
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
end