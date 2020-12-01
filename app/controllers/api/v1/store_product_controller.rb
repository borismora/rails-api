module Api
    module V1
        class StoreProductController < ApplicationController

            def index
                storesProds = StoreProduct.order('id_store DESC');
                render json: storesProds
            end

            def show
                #http://localhost:3000/api/v1/store_product/params?id_store=3&id_product=1
                storesProds = StoreProduct.where(:id_store => params[:id_store].to_i, :id_product => params[:id_product])
                render json: storesProds
            end

            def create
                storesProds = StoreProduct.new(store_products_params);

                if storesProds.save 
                    render json: {response: "link store-product successfully stored", data: storesProds},status: :ok
                else 
                    render json: {response: "error storing link store-product", data: storesProds.errors},status: :unprocessable_entity
                end
            end

            def destroy
                storesProds = StoreProduct.find(params[:id]);
                storesProds.destroy
                render json: {response: "link store-product deleted", data: storesProds},status: :ok
            end

            def update
                storesProds = StoreProduct.find(params[:id]);
                if storesProds.update_attributes(store_products_params)
                    render json: {response: "link store-product successfully updated", data: storesProds},status: :ok
                else
                    render json: {response: "error updating link store-product", data: storesProds.errors},status: :unprocessable_entity
                end
            end

            private

            def store_products_params
                params.permit(:id_store, :id_product)
            end

        end
    end
end