module Orders
    class CreateOrder
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.create({id_store: params[:id_store], total: 0});

            if order.save
                context.detail = GetOrderDetail.new( {detalle: params[:detalle], order: order} ).details
            end
        end
    end
end