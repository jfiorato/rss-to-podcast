class AddAudioUrlToPost < ActiveRecord::Migration
  def change
    add_column :posts, :audio_url, :string
  end
end
