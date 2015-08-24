class AddScoreandAvatartoUser < ActiveRecord::Migration
  def change
  	add_column :users, :score, :integer
  	add_column :users, :avatar, :string
  end
end
