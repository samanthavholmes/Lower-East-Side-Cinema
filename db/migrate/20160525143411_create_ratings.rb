class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :stars, null: false
      t.text :review
      t.references :user, foreign_key: true
      t.references :film, foreign_key: true

      t.timestamps null: false
    end
  end
end
