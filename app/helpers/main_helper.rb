module MainHelper
	def found_by(user_id)
		user = User.find_by_id(user_id)
		return user.name
	end

	def my_score()
		films =  Film.where(:updated_by => current_user.id)
		score = films.count
		return score
	end

end
