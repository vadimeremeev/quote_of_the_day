class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:incoming_message]

  before_filter :initialise_user

	def index
	end

  def initialise_user
    @message = Telegram.get_message(params)
    if @message.present?
      @user = User.where(:telegram_user_id => @message[:chat][:id]).first_or_create(
        :telegram_user_id => @message[:chat][:id],
        :first_name => @message[:chat][:first_name],
        :last_name => @message[:chat][:last_name],
        :username => @message[:chat][:username]
      )
    end
  end

	def incoming_message
	  if @message[:text].to_s.include?('/start')
	  	reply = 'Welcome to the Awesome Quote of the Day!'
    elsif @message[:text].to_s.include?('/motivate', '/m')
      reply = Quote.motivation_quote
	  else
	  	reply = Quote.random_quote
	  end

	  Telegram.send_message(@user.telegram_user_id,reply)

		render :nothing => true, :status => 200
	end
end
