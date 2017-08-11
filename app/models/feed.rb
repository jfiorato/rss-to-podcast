class Feed < ActiveRecord::Base
  belongs_to  :user
  has_many    :posts,    dependent: :destroy

  validates   :user,     presence: true
  validates   :url,      presence: true

  after_destroy :cleanup_audio_files


  def cleanup_audio_files
    DestroyPostAudioJob.perform_later self.id
  end
end
