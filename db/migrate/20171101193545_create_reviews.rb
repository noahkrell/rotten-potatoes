class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :movie_id, { null: false }
      t.integer :user_id, { null: false }
      t.decimal :spud_score, { null: false }

      t.timestamps
    end
  end
end
