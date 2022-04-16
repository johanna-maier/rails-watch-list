class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title, unique: true, null: false
      t.text :overview, null: false
      t.string :post_url

      t.timestamps
    end
  end
end
