class FHServices
  def initialize
    @connection = Faraday.new(url: "https://demo.fareharbor.com/api/external/v1/companies/marina/")
  end

  def get_company
#  curl -X GET "https://demo.fareharbor.com/api/external/v1/companies/?api-app=9d524aaa-aed7-462f-9133-f6a25a88d431&api-user=8def417d-b7e9-4364-a870-3e2a195b105b"

  end

  def get_item
#     curl -X GET "https://demo.fareharbor.com/api/external/v1/companies/marina/items/?api-app=9d524aaa-aed7-462f-9133-f6a25a88d431&api-user=8def417d-b7e9-4364-a870-3e2a195b105b"
  end
end
