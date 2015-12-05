class TelegramApi
  require "uri"
  require "net/http"

  attr_accessor :root_url
  attr_accessor :app_token

  def initialize(token)
    @root_url = 'https://api.telegram.org'
    @app_token = token
  end

  def get_message(params)
    if params[:update_id].present? && params[:message].present?
       params[:message]
    end
  end

  def send_message(chat_id, text, parse_mode=false,disable_web_page_preview=false,reply_to_message_id=false,reply_markup=false)
    params = {
      'chat_id' => chat_id.to_s,
      'text' => text.to_s
    }

    begin
      response = RestClient.post("#{@root_url}/#{@app_token}/sendMessage", params, :content_type => :json)
    rescue => e
      Rails.logger.error "Send Message Exception: #{e}"
    end
  end
end