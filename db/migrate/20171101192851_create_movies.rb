class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title, { null: false }
      t.text :description
      t.integer :runtime
      t.string :mpaa_rating
      t.string :director
      t.date :release
      t.integer :api_id

      t.timestamps
    end
  end
end
