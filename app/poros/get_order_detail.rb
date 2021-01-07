class GetOrderDetail
    def initialize(params)
        @params = params;
    end

    delegate :params, to: :context

    def details
        item_details
    end

    def item_details
        total = 0
        params[:detalle].each do |prod|
            product = Product.find(prod[:id_product]);
            total += product[:price] * prod[:quantity]
            order_detail = OrderDetail.new(add_item(prod, params[:order]));
            order_detail.save
        end
    end

    def add_item(prod, order)
        {
            id_order: order[:id_order], 
            id_product: prod[:id_product], 
            quantity: prod[:quantity]
        }
    end

    attr_accessor :params
end