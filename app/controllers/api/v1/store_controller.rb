module Api
    module V1
        class StoreController < ApplicationController

            def index
                stores = Store.order('id_store DESC');
                render json: stores
            end

            def show
                store = Store.find(params[:id]);
                render json: store
            end

            def create
                store = Store.new(store_params);

                if store.save 
                    render json: {response: "store successfully stored", data: store},status: :ok
                else 
                    render json: {response: "error storing store", data: store.errors},status: :unprocessable_entity
                end
            end

            def destroy
                store = Store.find(params[:id]);
                store.destroy
                render json: {response: "store deleted", data: store},status: :ok
            end

            def update
                store = Store.find(params[:id]);
                if store.update_attributes(store_params)
                    render json: {response: "store successfully updated", data: store},status: :ok
                else
                    render json: {response: "error updating store", data: store.errors},status: :unprocessable_entity
                end
            end

            private

            def store_params
                params.permit(:name, :address, :email, :phone)
            end

        end
    end
end