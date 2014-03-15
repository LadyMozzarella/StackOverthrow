class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.integer :vote_count, :default => 0
      t.belongs_to :question
      t.belongs_to :user
    end
  end
end
