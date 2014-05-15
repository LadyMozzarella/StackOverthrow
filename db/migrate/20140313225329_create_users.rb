class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.integer :reputation, default: 0
      t.timestamps
    end
  end

  def down
  end
end
