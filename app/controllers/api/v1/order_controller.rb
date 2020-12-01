module Api
    module V1
        class OrderController < ApplicationController

            # get all orders
            def index
                order = Order.order('id_order DESC');
                render json: order
            end

            # shows the searched order and its details
            def show
                order = Order.find(params[:id]);
                order_detail = OrderDetail.where(:id_order => params[:id])
                details = []

                order_detail.each do |detail|
                    product = Product.find(detail[:id_product]);
                    details.push({id_product: detail[:id_product], name: product[:name], type: product[:typee], quantity: detail[:quantity], price: product[:price], sub_total: product[:price] * detail[:quantity]})
                end
                
                render json: {order: order, orderDetails: details}
            end

            # create a new order
            def create
                order = Order.new({id_store: order_params[:id_store], total: 0});
                total = 0

                if order.save
                    params[:detalle].each do |prod|
                        product = Product.find(prod[:id_product]);
                        total += product[:price] * prod[:quantity]
                        order_detail = OrderDetail.new({id_order: order[:id_order], id_product: prod[:id_product], quantity: prod[:quantity]});
                        order_detail.save
                    end

                    if order.update_attributes({id_store: order_params[:id_store], total: total})
                        render json: {response: "order and details successfully created", data: order, detail: params[:detalle]},status: :ok
                    else
                        render json: {response: "error creating order and details", data: order.errors},status: :unprocessable_entity
                    end
                else
                    render json: {response: "error creating order and details", data: order.errors},status: :unprocessable_entity
                end
                
            end

            # delete order
            def destroy
                order = Order.find(params[:id]);
                order.destroy
                render json: {response: "order and details deleted", data: order},status: :ok
            end

            # update order and details
            def update
                order = Order.find(params[:id]);
                OrderDetail.where(:id_order => params[:id]).delete_all
                total = 0

                params[:detalle].each do |prod|
                    product = Product.find(prod[:id_product]);
                    total += product[:price] * prod[:quantity]
                    order_detail = OrderDetail.new({id_order: params[:id], id_product: prod[:id_product], quantity: prod[:quantity]});
                    order_detail.save
                end

                if order.update_attributes({id_store: params[:id_store], total: total})
                    render json: {response: "order and details successfully created", data: order, detail: params[:detalle]},status: :ok
                else
                    render json: {response: "error creating order and details", data: order.errors},status: :unprocessable_entity
                end
            end

            private

            # validate parameters
            def order_params
                params.permit(:id_store, :detalle)
            end

        end
    end
end