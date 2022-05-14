class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.integer :favoriter_id, index: true, foreign_key: true
      t.integer :favorited_event_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
