class User < ActiveRecord::Base
  attr_accessible :name, :email, :password

  validates :email, :password, presence: true

  has_secure_password
end