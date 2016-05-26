require 'rails_helper'

describe SessionsController do
  include SessionsHelper

  let!(:user) { User.create({first_name: "test", last_name:"test", email: "test2@test.com", password: "123456", role: "public" })}

  describe 'GET #login' do
    it "initializes a blank user for logging in" do
      get :new
      expect(assigns(:user)).to be_an_instance_of(User)
    end
  end

  describe "POST #login" do
    context "when valid params are passed" do
      it "creates a new session for a specific user" do
        post :create, { session: { email:"test2@test.com", password:"123456"} }
        expect(current_user).to eq(user)
      end
    end

    context "when an incorrect password is passed with an email that exists" do
      it "does not log in" do
        post :create, { session: { email:"test2@test.com", password:"1234567"} }
        expect(current_user).to eq(nil)
      end
      it "returns a email or password error" do
        post :create, { session: { email:"test2@test.com", password:"1234567"} }
        expect(current_user[:errors]).to_not be_empty
      end
    end

    context "when an email that doesn't exists is passed" do
      it "does not log in" do
        post :create, { session: { email:"tes2@test.com", password:"123456"} }
        expect(current_user).to eq(nil)
      end
      it "reutrns an email or password error" do
        post :create, { session: { email:"tes2@test.com", password:"123456"} }
        expect(current_user[:errors]).to_not be_empty
      end
    end
  end

  describe "GET #logout" do
    it "deletes a session for a specific user" do
        get :destroy, { id: user.id}
        expect(current_user).to eq(nil)
    end
  end
end
