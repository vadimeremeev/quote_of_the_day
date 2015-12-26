class TheySaidSo

  def self.quote_of_the_day
    begin
      request = RestClient.get("http://api.theysaidso.com/qod.json", :content_type => :json)
      quote   = JSON.parse(request)
    rescue => e
  	  Rails.logger.error("Error happened #{e}")
    end

    quote["contents"].present? ? quote["contents"]["quotes"][0]["quote"] : ""
  end

end