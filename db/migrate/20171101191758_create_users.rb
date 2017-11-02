class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, { null: false }
      t.string :email, { null: false, unique: true }
      t.string :password_digest, { null: false }
      t.string :username, { null: false, unique: true }
      t.boolean :critic

      t.timestamps
    end
  end
end
