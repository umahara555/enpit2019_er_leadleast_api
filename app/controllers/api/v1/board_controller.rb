module Api
  module V1
    class BoardController < ApplicationController
      def index
        data = [{id: 0, text: "hoge"}, {id: 1, text: "fuga"}, {id: 2, text: "piyo"}, {id: 3, text: "meta"}]
        render json: { status: 'SUCCESS', board_data: data}
      end
    end
  end
end
