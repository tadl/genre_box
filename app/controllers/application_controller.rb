class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def shared_variables
  	@genre_list = ["Educational TV",
  					"Action / Adventure",
  					"Animation",
  					"Comdedy",
  					"Crime / Mystery",
  					"Documentary",
  					"Drama",
  					"Family",
  					"Fantasy",
  					"Foriegn",
  					"Horror",
  					"Music",
  					"Romance",
  					"Science Fiction",
  					"TV",
  					"Thriller",
  					"Western"]
  end

end
