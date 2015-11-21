class HomeController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:incoming_message]

	def index

	end

	def incoming_message
		Rails.logger.error ">>>Telegram: #{params}"
		render :nothing => true, :status => 200
	end
end
