require 'spec_helper'

describe SessionsController do
  let(:user_attributes) {
    { name: "Jeffrey", email: "jeffrey@example.com", password: "dolphins" }
  }
  let(:user) { User.create(user_attributes) }

  context "sign in" do

    it "should create a new session when a user signs in" do
      post :create, { email: user.email, password: user_attributes[:password] }
      expect(session[:user_id]).not_to be_nil
    end
  end

  context "sign out" do

    it "should delete the session" do
      delete :destroy, { id: user.id }
      expect(session).to be_empty
    end

  end

end
