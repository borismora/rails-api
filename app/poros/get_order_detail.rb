class GetOrderDetail
    def initialize(id_order)
        @id_order = id_order;
    end

    delegate :id_order, to: :context

    def details
        item_details
    end

    def item_details
        OrderDetail.where(:id_order => id_order).map { |item| add_item(Product.find(item[:id_product]), item) }
    end

    def add_item(product, detail)
        {
            id_product: detail[:id_product], 
            name: product[:name], 
            type: product[:typee], 
            quantity: detail[:quantity], 
            price: product[:price], 
            sub_total: product[:price] * detail[:quantity]
        }
    end

    attr_accessor :id_order
end