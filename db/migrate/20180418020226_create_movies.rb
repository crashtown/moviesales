class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :director
      t.string :genre
      t.float :price

      t.timestamps
    end
  end
end
