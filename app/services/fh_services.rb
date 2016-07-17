class FHServices
  def initialize
    @connection = Faraday.new(url: "https://demo.fareharbor.com/api/external/v1/companies/")
  end

  def get_company
    @connection.get "/?api-app="+"#{ENV["APPKEY"]}"+"&api-user="+"#{ENV["user_key"]}"
  end

  def get_item
  end
end
