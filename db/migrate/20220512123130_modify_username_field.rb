class ModifyUsernameField < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :username, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
