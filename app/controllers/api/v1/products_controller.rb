module Api
  module V1
    class ProductsController < ApplicationController
      def create
        product_id = SecureRandom.alphanumeric(8)
        product = Product.new(product_id: product_id)
        if product.save
          render json: { status: 'SUCCESS', product_id: product.product_id }
        else          
          render json: { status: 'FAILED' }
        end 
      end
    end
  end
end