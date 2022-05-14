class AddPrivateAndInviteToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :private, :boolean
    add_column :events, :invite_only, :boolean
  end
end
