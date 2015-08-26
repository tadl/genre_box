class StringToTextMoreFilm < ActiveRecord::Migration
  def change
  	change_column :films, :artist, :text
  	change_column :films, :legacy_genres, :text
  end
end
