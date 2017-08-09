class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :user,    presence: true
  validates :url,     presence: true
end
