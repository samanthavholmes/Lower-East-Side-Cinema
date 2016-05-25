class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :title, null: false, unique: true
      t.srting :picture

      t.timestamps null: false
    end
  end
end
