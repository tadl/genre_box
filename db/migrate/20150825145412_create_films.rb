class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :record_id
      t.string :title
      t.string :artist
      t.string :abstract
      t.string :release_date
      t.string :publisher
      t.string :track_list
      t.string :legacy_genres

      t.timestamps
    end
  end
end
