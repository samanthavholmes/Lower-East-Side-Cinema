#Model validations, associations, and methods tested

require 'rails_helper'
describe Genre do
  let(:first_user) {User.create ({first_name: "test", last_name: "test", email: "test@test.com", password: "password", role: "judge"}) }
  let(:genre1){Genre.new}
  let(:genre2){Genre.create({title: "horror", picture: "picture.jpg"})}
  let(:film) {Film.create({title: "Gone with the wind",description: "Description", director: "Leo", picture: "picture.jpg"})}
  let(:film2) {Film.create({title: "Film",description: "Description", director: "Leo", picture: "picture.jpg"})}
  let(:rating){Rating.create({stars: 1})}
  let(:rating2){Rating.create({stars: 2})}

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

      it "is valid with a picture" do
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

  context "Methods" do

    describe "#genre.sort_by_stars" do
      it "sorts the films from highest to lowest rated" do
        first_user.ratings << rating
        first_user.ratings << rating2
        film.ratings << rating
        film2.ratings << rating2
        genre2.films << film
        genre2.films << film2
        expect(genre2.sort_by_stars).to eq( [film2, film] )
      end
    end

    describe "#genre.film_winner" do
      it "gives the movie with the highest stars" do
        first_user.ratings << rating
        first_user.ratings << rating2
        film.ratings << rating
        film2.ratings << rating2
        genre2.films << film
        genre2.films << film2
        expect(genre2.film_winner).to eq(film2)
      end
    end
  end
end
