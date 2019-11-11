module Api
  module V1
    class ProductsController < ApplicationController
      def index
        render json: { status: 'SUCCESS', products: Product.all }
      end
      def create
        product = Product.new()
        if product.save
          render json: { status: 'SUCCESS', product_id: product.id }
        else          
          render json: { status: 'FAILED' }
        end 
      end
    end
  end
end