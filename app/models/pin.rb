class Pin < ActiveRecord::Base
  acts_as_votable
  acts_as_taggable
  belongs_to :user
  has_many :comments
  references :tags, :pins, index: true
end
