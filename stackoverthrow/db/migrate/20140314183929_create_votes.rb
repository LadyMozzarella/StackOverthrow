class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up_down
      t.belongs_to :votable, polymorphic: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
