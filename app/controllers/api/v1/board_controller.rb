module Api
  module V1
    class BoardController < ApplicationController
      def index
        data = [{id: 0, text: "hoge"}, {id: 1, text: "fuga"}, {id: 2, text: "piyo"}, {id: 3, text: "meta"}]
        render json: { status: 'SUCCESS', board_data: data}
      end

      def card_data
        data = HandCard.all
        SyncBoardJob.perform_later(data)
        render json: { status: 'SUCCESS', card_data: data}
      end

      def new
        data = HandCard.new(card_params)
        if data.save
          SyncBoardJob.perform_later(data)
          render json: { status: 'SUCCESS'}
        else
          render json: { status: 'FAILED' }
        end

      end

      def delete_data
        unless params[:id].blank?
          id_data = params[:id].to_i
        end
        if HandCard.find(id_data).destroy
          render json: { status: 'SUCCESS'}
        else
          render json: { status: 'FAILED' }
        end
      end

      private
        def card_params
          params.require(:board).permit(:text)
        end
    end
  end
end
