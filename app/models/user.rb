class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    extra = access_token.extra.raw_info
    user = User.where(:email => data["email"]).first
    unless user
    		if extra["hd"] == 'tadl.org'
        	user = User.create(name: data["name"],
          	email: data["email"],
          	password: Devise.friendly_token[0,20],
          	email: data["email"],
          	avatar: data["image"],
        	)
        end
    end
    user
	end
end
