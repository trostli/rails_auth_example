require 'spec_helper'

describe User do

  let(:user_attributes) {
    { name: "Jeffrey", email: "jeffrey@example.com", password: "dolphins" }
  }

  context "#save" do

    let(:user) { User.new }

    it "raises an error if email or password is missing" do
      expect { user.save! }.to raise_error
    end

    it "creates a new user when name, email, and password is supplied" do
      user.name = user_attributes[:name]
      user.email = user_attributes[:email]
      user.password = user_attributes[:password]
      expect { user.save }.to change(User, :count).by(1)
      expect(User.last.name).to eql(user_attributes[:name])
    end

  end

  context "#authenticate" do

    let(:user) { User.new(user_attributes) }

    it "should return true if the password is correct" do
      user.save
      expect(user.authenticate(user_attributes[:password])).to be_true
    end

    it "should return false if the password is incorrect" do
      user.save
      expect(user.authenticate("NOT_RIGHT-#{Time.now}")).to be_false
    end

  end

end
