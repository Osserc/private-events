class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.integer :attendee_id, index: true, foreign_key: true
      t.integer :attended_event_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
