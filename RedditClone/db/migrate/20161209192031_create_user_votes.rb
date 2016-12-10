class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :user_id, null: false
      t.integer :value, null: false

      t.timestamps

      t.integer :votable_id, null: false
      t.string :votable_type, null: false
    end
  end
end
