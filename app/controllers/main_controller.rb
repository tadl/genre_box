class MainController < ApplicationController
  require 'uri'
  before_filter :shared_variables
  respond_to :html, :json, :js

  def index
  	@films = Film.where(:found => false, :not_found => false).paginate(:page => params[:page], :per_page => 8)
  end

  def found
  	@films = Film.where(:found => true, :not_found => false).paginate(:page => params[:page], :per_page => 8)
  end

  def not_found
  	@films = Film.where(:not_found => true).paginate(:page => params[:page], :per_page => 8)
  end

  def about
  end

  def leaders
  	@users = User.all
  end

  def update_genre
  	posted_genres = params[:genres].split(',')
  	traget_record = params[:record_id]
  	i = 0
  	new_genres = String.new
  	posted_genres.each do |g|
  		unescaped_genre = CGI::unescape(g)
  		if !@genre_list.include?(unescaped_genre)
  			i = i + 1
  		else
  			new_genres = new_genres + unescaped_genre + ','
  		end
  	end
  	if i != 0
  		@message = "fail"
  		@title = "fail"
  		@genres = "invalid genres"
  	else
  		@message = "success"
  		@genres = new_genres
  		f = Film.find_by_record_id(traget_record)
  		f.new_genres = new_genres
  		if !new_genres.blank?
  			f.updated_by = current_user.id
  			f.found = true
  			f.need_to_send = true
  			f.not_found = false
  		else
  			f.updated_by = nil
  			f.found = false
  			f.need_to_send = false
  		end
  		f.save
  		@title = f.title
  	end
  	respond_to do |format|
      format.json {render :json =>{:message => @message, :title => @title, :genres => @genres}}
    end
  end

  def mark_not_found
 	f = Film.find_by_record_id(params[:record_id])
 	f.found = false
 	f.need_to_send = false
 	f.not_found = true
 	f.updated_by = nil
 	f.new_genres = ''
 	f.save
 	respond_to do |format|
        format.js  {render :js => "Turbolinks.visit(document.URl)" }
    end
  end

  def edit
  	@film = Film.find_by_record_id(params[:record_id])
  	@record_id = params[:record_id]
  	@selected_genres = @film.new_genres.split(',')
  	@target_div = '#edit_or_not_' + params[:record_id]
  	respond_to do |format|
      format.js 
    end
  end

  def cancel_edit
  	@film = Film.find_by_record_id(params[:record_id])
  	@target_div = '#edit_or_not_' + params[:record_id]
  	respond_to do |format|
      format.js 
    end
  end 

end
