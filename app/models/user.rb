class User < ActiveRecord::Base
  has_many :feeds

  validates :user_cookie, presence: true
end
