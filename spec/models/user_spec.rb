require 'rails_helper'
describe User do
  let(:first_user) {User.create ({first_name: "test", last_name: "test", email: "test@test.com", password: "password", role: "judge"}) }
  let(:rating) {Rating.create({stars: 5, review: "blah"})}
  let(:comment) {Comment.create({body: "blah"})}
  let(:user) { User.new }

  context "Validations" do

    describe "#first_name" do
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:first_name]).to_not be_empty
      end

      it "is valid when it's not nil" do
        first_user.valid?
        expect(user.errors[:first_name]).to be_empty
      end
    end

    describe "#last_name" do
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:last_name]).to_not be_empty
      end

      it "is valid when it's not nil" do
        first_user.valid?
        expect(user.errors[:last_name]).to be_empty
      end
    end

    describe "#role" do
      it "cannot be nil" do
        user.role = ""
        user.valid?
        expect(user.errors[:role]).to_not be_empty
      end

      it "is valid when it's not nil" do
        first_user.valid?
        expect(user.errors[:role]).to be_empty
      end
    end

    describe "#email" do
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end

      it "is valid when it's not nil" do
        first_user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it "is not valid when it's not unique" do
        user.email = first_user[:email]
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end

      it "is valid when it is unique" do
        first_user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it "is valid if in email format" do
        first_user.valid?
        expect(user.errors[:email]).to be_empty
      end

      it "is not valid if not in email format" do
        user.email = "iu32bv"
        user.valid?
        expect(user.errors[:email]).to_not be_empty
      end
    end

    describe "#password" do
      it "cannot be nil" do
        user.valid?
        expect(user.errors[:password]).to_not be_empty
      end

      it "is valid when it's not nil" do
        first_user.valid?
        expect(user.errors[:password]).to be_empty
      end

      it "must be over 6 characters" do
        user.password = "123456"
        user.valid?
        expect(user.errors[:password]).to be_empty
      end

      it "cannot be less 6 characters" do
        user.password = "12345"
        user.valid?
        expect(user.errors[:password]).to_not be_empty
      end

      it "must be less than 25 characters" do
        user.password = "1234512345123451234512345123451234512345"
        user.valid?
        expect(user.errors[:password]).to_not be_empty
      end
    end

    describe "#bio" do
      it "valid when nil" do
        user.valid?
        expect(user.errors[:bio]).to be_empty
      end
    end

    describe "#picture" do
      it "valid be nil" do
        user.valid?
        expect(user.errors[:picture]).to be_empty
      end
    end

  end
  context "Associations" do
    describe "#user.ratings" do

      it "has an association with ratings" do
        first_user.ratings << rating
        expect(first_user.ratings).to_not be_empty
      end

      it "returns an empty array if there are no associations" do
        expect(first_user.ratings).to be_empty
      end

      it "has an association with ratings" do
        first_user.comments << comment
        expect(first_user.comments).to_not be_empty
      end

      it "returns an empty array if there are no associations" do
        expect(first_user.comments).to be_empty
      end

    end
  end
  context "Methods" do
    describe "#judge?" do

      it "it returns true if a person's role is judge" do
        expect(first_user.judge?).to eq true
      end

      it "it returns false if a person's role is something other than judge" do
        first_user.role = "public"
        expect(first_user.judge?).to eq false
      end

    end
  end
end
