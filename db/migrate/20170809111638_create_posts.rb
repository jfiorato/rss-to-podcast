class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer            :feed_id,    null: false
      t.string             :entry_id,   null: false
      t.string             :title
      t.text               :content
      t.timestamps                      null: false
    end

    add_index :posts,      [:feed_id, :entry_id]
  end
end
