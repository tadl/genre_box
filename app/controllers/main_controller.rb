class MainController < ApplicationController
  def index
  end

  def about
  end

  def leaders
  	@users = User.all
  end
end
