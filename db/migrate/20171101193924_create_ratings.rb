class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rateable_id
      t.string  :rateable_type
      t.decimal :spud_score
      t.integer :user_id, { null: false }

      t.timestamps
    end
  end
end
