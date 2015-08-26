class PublisherToText < ActiveRecord::Migration
  def change
  	change_column :films, :publisher, :text
  end
end
