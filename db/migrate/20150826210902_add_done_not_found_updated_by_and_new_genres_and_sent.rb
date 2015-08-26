class AddDoneNotFoundUpdatedByAndNewGenresAndSent < ActiveRecord::Migration
  def change
  	add_column :films, :new_genres, :text
  	add_column :films, :updated_by, :integer
  	add_column :films, :not_found, :boolean, default: false
  	add_column :films, :found, :boolean, default: false
  	add_column :films, :need_to_send, :boolean, default: false
  end
end
