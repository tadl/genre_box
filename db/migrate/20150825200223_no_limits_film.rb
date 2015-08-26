class NoLimitsFilm < ActiveRecord::Migration
  def change
  	change_column :films, :artist, :text, :limit => nil
  	change_column :films, :legacy_genres, :text, :limit => nil
  	change_column :films, :track_list, :text, :limit => nil
  	change_column :films, :abstract, :text, :limit => nil
  	change_column :films, :title, :text, :limit => nil
  end
end
