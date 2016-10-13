class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :entry, index: true, foreign_key: true
      t.integer :vote_value
      t.string :username

      t.timestamps null: false
    end
  end
end
