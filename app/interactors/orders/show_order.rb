module Orders
    class ShowOrder
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.find(params[:id_order]);
            context.detail = GetOrderDetail.new( order[:id_order] ).details
        end
    end
end