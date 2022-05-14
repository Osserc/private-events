class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :invitee_id, index: true, foreign_key: true
      t.integer :invited_event_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
