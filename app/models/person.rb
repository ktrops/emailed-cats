class Person < ActiveRecord::Base
  has_many :cat_videos

  validates :email, presence: true
end
