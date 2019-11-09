module Api
  module V1
    class BoardController < ApplicationController
      def index
        data = [{id: 0, text: "hoge"}, {id: 1, text: "fuga"}, {id: 2, text: "piyo"}, {id: 3, text: "meta"}]
        render json: { status: 'SUCCESS', board_data: data}
      end

      def card_data
        board_cards = BoardCard.all
        data = { status: 'SUCCESS', card_data: board_cards}
        # SyncBoardJob.perform_later(data.to_json)
        render json: data
      end

      def new
        board_card = BoardCard.new(card_params)
        if board_card.save
          board_cards = BoardCard.all
          data = { status: 'SUCCESS', card_data: board_cards}
          SyncBoardJob.perform_later(data.to_json)
          render json: { status: 'SUCCESS'}
        else
          render json: { status: 'FAILED' }
        end

      end

      def delete_data
        unless params[:id].blank?
          id_data = params[:id].to_i
        end
        if BoardCard.find(id_data).destroy
          board_cards = BoardCard.all
          data = { status: 'SUCCESS', card_data: board_cards}
          SyncBoardJob.perform_later(data.to_json)
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
