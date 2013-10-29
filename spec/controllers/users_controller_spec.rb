require 'spec_helper'

describe UsersController do

  context "new user form" do

    it "should have a sign up form" do
      get :new
      expect(response).to render_template(:new)
    end

  end

  context "create user" do
    let(:user_attributes) {
      { name: "Jeffrey", email: "jeffrey@example.com", password: "dolphins" }
    }

    it "should create a new user with valid info" do
      expect {
        post :create, { user: user_attributes }
      }.to change(User, :count).by(1)
    end

    it "should create a session" do
      post :create, { user: user_attributes }
      expect(session[:user_id]).not_to be_nil
    end

  end

end
