module BarServe
  class API < Grape::API
    prefix 'api'
    format :json
    mount ::BarServe::Order
    add_swagger_documentation api_version: 'v1'
  end
end
