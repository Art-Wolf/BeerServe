module BarServe
  class Order < Grape::API
    version 'v1'
    format :json

    resource :order do
      desc "Create order" , params: BarServe::Models::Order.fields.dup.tap {|fields| fields.delete("_id") }
      post do
        order = BarServe::Models::Order.create!( {
          name: params[:name],
          order: params[:order],
          orderid: rand(36**8).to_s(16),
          bar: params[:bar]
        } )

        # Returns the order id as a JSON escaped String
        order.orderid.to_s
      end

      desc "Retrieve a order based on the ID."
      params do
        requires :orderid, type: String, desc: "Order id."
      end
      route_param :orderid do
        get do
          order = BarServe::Models::Order.where({orderid: params[:orderid]})
          error! "Not Found", 404 unless order
          order.as_json
        end
      end
      #desc "Retrieve a order based on the ID"
      #params do
      #  requires :orderid, type: String, desc: "Order ID."
      #end
      #get do
      #  order = BarServe::Models::Order.where({orderid: params[:orderid]})
      #  error! "Not Found", 404 unless order
      #  order.as_json
      #end
    end
  end
end
