class StringToTextFilm < ActiveRecord::Migration
  def change
  	change_column :films, :track_list, :text
  	change_column :films, :abstract, :text
  end
end
