class FHServices
  def initialize
    @connection = Faraday.new(url: "https://demo.fareharbor.com/api/external/v1/companies/")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_company
    @connection.get "?api-app="+"#{ENV["APPKEY"]}"+"&api-user="+"#{ENV["user_key"]}"
  end

  def get_item(shortname)
    @connection.get "#{shortname}/items/?api-app=" + "#{ENV["APPKEY"]}"+"&api-user="+"#{ENV["user_key"]}"
  end

  def companies_hash
    parse(get_company)
  end

  def items_hash(shortname)
    #shortname could potentially be an array of all short names within a location
    parse(get_item(shortname))
  end
end
