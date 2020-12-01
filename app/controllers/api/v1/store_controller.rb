module Api
    module V1
        class StoreController < ApplicationController

            # get all stores
            def index
                stores = Store.order('id_store DESC');
                render json: stores
            end

            # show store
            def show
                store = Store.find(params[:id]);
                render json: store
            end

            # create a new store
            def create
                store = Store.new(store_params);

                if store.save 
                    render json: {response: "store successfully stored", data: store},status: :ok
                else 
                    render json: {response: "error storing store", data: store.errors},status: :unprocessable_entity
                end
            end

            # delete store
            def destroy
                store = Store.find(params[:id]);
                store.destroy
                render json: {response: "store deleted", data: store},status: :ok
            end

            # update store
            def update
                store = Store.find(params[:id]);
                if store.update_attributes(store_params)
                    render json: {response: "store successfully updated", data: store},status: :ok
                else
                    render json: {response: "error updating store", data: store.errors},status: :unprocessable_entity
                end
            end

            private

            # validate parameters
            def store_params
                params.permit(:name, :address, :email, :phone)
            end

        end
    end
end