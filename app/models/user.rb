class User < ActiveRecord::Base
  acts_as_voter
  has_many :pins
  has_many :comments
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable
end
