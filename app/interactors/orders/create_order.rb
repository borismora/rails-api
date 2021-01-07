module Orders
    class CreateOrder
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.create({id_store: params[:id_store], total: 0});
            total = 0

            if order.save
                params[:detalle].each do |prod|
                    product = Product.find(prod[:id_product]);
                    total += product[:price] * prod[:quantity]
                    order_detail = OrderDetail.new({id_order: order[:id_order], id_product: prod[:id_product], quantity: prod[:quantity]});
                    order_detail.save
                end
            end
        end
    end
end