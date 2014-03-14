class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :votable, polymorphic: true
      t.belongs_to :user
      t.boolean :vote
    end
  end
end
