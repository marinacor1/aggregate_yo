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

  def get_item(company)
    if company.class == String
      @connection.get "#{company}/items/?api-app=" + "#{ENV["APPKEY"]}"+"&api-user="+"#{ENV["user_key"]}"
    else
      @connection.get "#{company.shortname}/items/?api-app=" + "#{ENV["APPKEY"]}"+"&api-user="+"#{ENV["user_key"]}"
    end
  end

  def companies_hash
    parse(get_company)
  end

  def items_hash(shortname)
    parse(get_item(shortname))
  end
end
