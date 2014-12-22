module BarServe
  module Models
    class Order
      include Mongoid::Document
      store_in collection: "orders", database: "heroku_app32646000"

      field :id, type: String, description: "Id."
      field :orderid, type: String, description: "Order Id."
      field :name, type: String, description: "The User' Naame."
      field :order, type: String, description: "Order."
      field :bar, type: String, description: "Bar."

    end
  end
end
