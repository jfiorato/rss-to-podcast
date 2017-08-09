class Post < ActiveRecord::Base
  belongs_to  :feed

  validates   :feed,          presence: true
  validates   :entry_id,      presence: true

  scope       :by_date_desc,  -> { order('created_at desc') }
  scope       :with_audio,    -> { where('audio_url is not null') }
end
