class CreateAnswers < ActiveRecord::Migration
  def create
    create_table :answers do |t|
      t.text :text
    end
  end
end
