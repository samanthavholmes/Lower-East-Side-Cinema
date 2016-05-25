class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.text :description, null: false
      t.string :picture, null: false
      t.references :genre, foreign_key: true

      t.timestamps null: false
    end
  end
end
