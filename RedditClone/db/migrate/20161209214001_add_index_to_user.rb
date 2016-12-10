class AddIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :session_token, unique: true
    add_index :users, :name, unique: true
    add_index :subs, :name, unique: true
  end
end
