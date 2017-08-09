class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer             :user_id,   null: false
      t.string              :url,       null: false
      t.timestamps                      null: false
    end
  end
end
