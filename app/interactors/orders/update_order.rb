module Orders
    class UpdateOrder
        include Interactor

        delegate :params, to: :context

        def call
            order = Order.find(params[:id]);
            OrderDetail.where(:id_order => params[:id]).delete_all
            total = 0

            params[:detalle].each do |prod|
                product = Product.find(prod[:id_product]);
                total += product[:price] * prod[:quantity]
                order_detail = OrderDetail.new({id_order: params[:id], id_product: prod[:id_product], quantity: prod[:quantity]});
                order_detail.save
            end

            order.update_attributes({id_store: params[:id_store], total: total})
        end

        private

            # validate parameters
            def order_params
                params.permit(:id_store, :detalle)
            end
    end
end