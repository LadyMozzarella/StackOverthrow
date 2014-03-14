class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :text
      t.timestamps

      t.belongs_to :user
    end
  end
end
