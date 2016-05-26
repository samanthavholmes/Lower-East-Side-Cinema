require 'rails_helper'
describe Rating do
	let!(:rating) {Rating.create({stars: 1.0, review: "text"})}
	let!(:rating2) {Rating.create({})}
	
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

end