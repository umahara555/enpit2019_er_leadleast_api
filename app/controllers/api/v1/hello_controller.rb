module Api
  module V1
    class HelloController < ApplicationController
      def hello
        render json: { status: 'SUCCESS', message: 'Hello World!'}
      end
    end
  end
end
