class Icndb

  def self.random_joke
    begin
      request = RestClient.get("http://api.icndb.com/jokes/random", :content_type => :json)
      quote   = JSON.parse(request)
    rescue => e
      Rails.logger.error("Error happened #{e}")
    end

    quote["value"].present? ? quote["value"]["joke"] : ""
  end

  def self.fact_about_you(first_name, last_name)
    begin
      request = RestClient.get("http://api.icndb.com/jokes/random?limitTo=[nerdy,explicit]&firstName=#{first_name}&lastName=#{last_name}", :content_type => :json)
      quote   = JSON.parse(request)
    rescue => e
      Rails.logger.error("Error happened #{e}")
    end

    quote["value"].present? ? quote["value"]["joke"] : ""
  end
end