module Api
    module V1
        class OrderController < ApplicationController

            def index
                order = Order.order('id_order DESC');
                render json: order
            end

            def show
                order = Order.find(params[:id]);
                render json: order
            end

            def create
                order = Order.new({id_store: order_params[:id_store], total: 0});
                total = 0

                if order.save
                    params[:detalle].each do |prod|
                        product = Product.find(prod[:id_product]);
                        total += product[:price] * prod[:quantity]
                        order_detail = OrderDetail.new({id_order: order[:id_order], id_product: prod[:id_product], quantity: prod[:quantity]});
                        print order_detail
                        order_detail.save
                    end

                    if order.update_attributes({id_store: order_params[:id_store], total: total})
                        render json: {response: "order successfully created", data: order, detail: params[:detalle]},status: :ok
                    else
                        render json: {response: "error creating order", data: order.errors},status: :unprocessable_entity
                    end
                else
                    render json: {response: "error creating order", data: order.errors},status: :unprocessable_entity
                end
                
            end

            def destroy
                order = Order.find(params[:id]);
                order.destroy
                render json: {response: "order deleted", data: order},status: :ok
            end

            def update
                order = Order.find(params[:id]);
                if order.update_attributes(order_params)
                    render json: {response: "order successfully updated", data: order},status: :ok
                else
                    render json: {response: "error updating order", data: order.errors},status: :unprocessable_entity
                end
            end

            private

            def order_params
                params.permit(:id_store, :detalle)
            end

        end
    end
end