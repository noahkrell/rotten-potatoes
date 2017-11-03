class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.integer :api_id, { null: false }

      t.timestamps
    end
  end
end
