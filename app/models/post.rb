class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  acts_as_taggable
  acts_as_taggable_on :tags

  validates :title, presence: true, 
  					length: { minimum: 5 }
end