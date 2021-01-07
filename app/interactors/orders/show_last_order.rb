module Orders
    class ShowLastOrder
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.last;
            context.detail = GetOrderDetail.new( order[:id_order] ).details
        end
    end
end