module Orders
    class CreateWithDetail
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.new({id_store: params[:id_store], total: 0});
            total = 0

            if order.save
                params[:detalle].each do |prod|
                    product = Product.find(prod[:id_product]);
                    total += product[:price] * prod[:quantity]
                    order_detail = OrderDetail.new({id_order: order[:id_order], id_product: prod[:id_product], quantity: prod[:quantity]});
                    order_detail.save
                end

                if order.update_attributes({id_store: order_params[:id_store], total: total})
                    context.detail = GetOrderDetail.new( order[:id_order] ).details
                end
            end
        end

        private

            # validate parameters
            def order_params
                params.permit(:id_store, :detalle)
            end
    end
end