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
                result = Orders::ShowOrder.call(params: params)
                if result.success?
                    render json: result.detail, status: :created
                else
                    render json: {error: result.errors}
                end
            end

            # create a new order
            def create
                result = Orders::OrganizerCreateOrder.call(params: params)
                if result.success?
                    render json: result.detail, status: :created
                else
                    render json: {error: result.errors}
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