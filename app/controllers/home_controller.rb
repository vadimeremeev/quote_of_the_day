class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:incoming_message]

	def index

	end

	def incoming_message
  	message = Telegram.get_message(params)
  	if message.present?
  	  user = User.where(:telegram_user_id => message[:chat][:id]).first_or_create(
        :telegram_user_id => message[:chat][:id],
        :first_name => message[:chat][:first_name],
        :last_name => message[:chat][:last_name],
        :username => message[:chat][:username]
  	  )

  	  if message[:text].try("include?('/start')")
  	  	reply = 'Welcome to the Awesome Quote of the Day!'
  	  else
  	  	reply = Quote.order("RANDOM()").first
  	  end
  	  Telegram.send_message(user.telegram_user_id,reply)
  	end

		Rails.logger.error ">>>Telegram: #{params}"
		render :nothing => true, :status => 200
	end
end
