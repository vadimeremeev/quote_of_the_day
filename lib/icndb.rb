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
end