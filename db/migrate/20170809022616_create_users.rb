class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string              :user_cookie,    null: false
      t.timestamps                           null: false
    end
  end
end
