module Api
    module V1
        class StoreController < ApplicationController

            def index
                stores = Store.order('id_store ASC');
                render json: stores
            end

            def show
                store = Store.find(params[:id]);
            end

        end
    end
end