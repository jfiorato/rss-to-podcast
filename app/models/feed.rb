class Feed < ActiveRecord::Base
  belongs_to  :user
  has_many    :posts,    dependent: :destroy

  validates   :user,     presence: true
  validates   :url,      presence: true
end
