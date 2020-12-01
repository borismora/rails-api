module Api
    module V1
        class ProductController < ApplicationController

            # get all products
            def index
                products = Product.order('id_product DESC');
                render json: products
            end

            # show product
            def show
                product = Product.find(params[:id]);
                render json: product
            end

            # create a new product
            def create
                product = Product.new(product_params);

                if product.save 
                    render json: {response: "product successfully stored", data: product},status: :ok
                else 
                    render json: {response: "error storing product", data: product.errors},status: :unprocessable_entity
                end
            end

            # delete product
            def destroy
                product = Product.find(params[:id]);
                product.destroy
                render json: {response: "product deleted", data: product},status: :ok
            end

            # update product
            def update
                product = Product.find(params[:id]);
                if product.update_attributes(product_params)
                    render json: {response: "product successfully updated", data: product},status: :ok
                else
                    render json: {response: "error updating product", data: product.errors},status: :unprocessable_entity
                end
            end

            private

            # validate parameters
            def product_params
                params.permit(:sku, :name, :price, :typee)
            end

        end
    end
end