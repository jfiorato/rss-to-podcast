class AddAudioSizeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :audio_file_size, :integer
  end
end
