module Api
    module V1
        class ProductController < ApplicationController

            def index
                products = Product.order('sku ASC');
                render json: products
            end

            def show
                product = Product.find(params[:id]);
                render json: product
            end

            def create
                product = Product.new(product_params);

                if product.save 
                    render json: {response: "product successfully stored", data: product},status: :ok
                else 
                    render json: {response: "error storing product", data: product.errors},status: :unprocessable_entity
                end
            end

            def destroy
                product = Product.find(params[:id]);
                product.destroy
                render json: {response: "product deleted", data: product},status: :ok
            end

            def update
                product = Product.find(params[:id]);
                if product.update_attributes(product_params)
                    render json: {response: "product successfully updated", data: product},status: :ok
                else
                    render json: {response: "error updating product", data: product.errors},status: :unprocessable_entity
                end
            end

            private

            def product_params
                params.permit(:sku, :name, :price, :typee)
            end

        end
    end
end