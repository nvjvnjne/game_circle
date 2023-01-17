class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.integer :genre, null: false
      t.integer :play_condition, null: false
      t.string :smallImageUrl
      t.string :largeImageUrl
      t.string :itemUrl
      t.string :opinion
      t.timestamps
    end
  end
end
