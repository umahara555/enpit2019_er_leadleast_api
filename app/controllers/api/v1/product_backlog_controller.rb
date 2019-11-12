module Api
  module V1
    class ProductBacklogController < ApplicationController
      # 一覧を取得
      def index
        render json: { status: 'SUCCESS', product_backlogs: ProductBacklog.all }
      end

      def show
        product_backlog = ProductBacklog.find_by(product_id: params[:product_id])
        if product_backlog.present?
          render json: { status: 'SUCCESS', product_id: product_backlog.product_id , board_texts: product_backlog.board_texts }
        else
          render json: { status: 'FAILED' }
        end
      end

      def create
        if ProductBacklog.find_by(product_id: params[:product_id]).blank?
          product_backlog = ProductBacklog.new()
          product_backlog.product_id = params[:product_id]
          product_backlog.board_texts = {
              txt1: { text: '' },
              txt2: { text: '' },
              txt3: { text: '' },
              txt4: { text: '' },
              txt5: { text: '' },
              txt6: { text: '' },
              txt7: { text: '' },
              txt8: { text: '' },
          }
          if product_backlog.save
            render json: { status: 'SUCCESS', product_id: product_backlog.product_id }
          else
            render json: { status: 'FAILED' }
          end
        else
          render json: { status: 'FAILED' }
        end
      end

      def update
        product_backlog = ProductBacklog.find_by(product_id: params[:product_id])
        if product_backlog.update_attributes(board_texts: text_params)
          render json: { status: 'SUCCESS', product_id: product_backlog.product_id , board_texts: product_backlog.board_texts }
        else
          render json: { status: 'FAILED' }
        end
      end

      # パラメータを取得する
      private
        def text_params
          params.require(:board_texts).permit(
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
              txt7: [:text ],
              txt8: [:text ],
          )
        end
    end
  end
end
