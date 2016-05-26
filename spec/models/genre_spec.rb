require 'rails_helper'
describe Genre do
  let(:genre1){Genre.new}
  let(:genre2){Genre.create({title: "horror", picture: "picture.jpg"})}
  let(:film) {Film.create({title: "Gone with the wind",description: "Description", director: "Leo", picture: "picture.jpg"})}
  let(:rating){Rating.create({stars: 1})}
  context "Validations" do

    describe "#title" do
      it "is invalid without a title" do
        genre1.valid?
        expect(genre1.errors[:title]).to_not be_empty
      end

      it "is valid with a title" do
        genre2.valid?
        expect(genre2.errors[:title]).to be_empty
      end
    end

    describe "#picture"do
      it "is invalid without a picture" do
        genre1.valid?
        expect(genre1.errors[:picture]).to_not be_empty
      end

      it "is valid with a title" do
        genre2.valid?
        expect(genre2.errors[:picture]).to be_empty
      end
    end
  end

  context "Associations" do

    describe "#genre.films" do
      it "returns an array of films if it has them" do
        genre2.films << film
        expect(genre2.films).to_not be_empty
      end
      it "returns an empty array if it has no films" do
        expect(genre2.films).to be_empty
      end
    end

    describe "#genre.film_ratings" do
      it "returns an array of ratings of films if it has them" do
        film.ratings << rating
        genre2.films << film
        expect(genre2.film_ratings).to_not be_empty
      end
      it "returns an empty array if it has no rated films" do
        expect(genre2.film_ratings).to be_empty
      end
    end
  end
end
