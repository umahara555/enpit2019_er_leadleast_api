module Api
  module V1
    class LeancanvasController < ApplicationController
      # 一覧を取得
      def index
        render json: { status: 'SUCCESS', leancanvasies: LeanCanvas.all }
      end

      def show
        leancanvas = LeanCanvas.find_by(product_id: params[:product_id])
        if leancanvas.present?
          render json: { status: 'SUCCESS', product_id: leancanvas.product_id , board_texts: leancanvas.board_texts }
        else
          render json: { status: 'FAILED' }
        end
      end

      def create
        if LeanCanvas.find_by(product_id: params[:product_id]).blank?
          leancanvas = LeanCanvas.new()
          leancanvas.product_id = params[:product_id]
          leancanvas.board_texts = {
              txt1: { text: '' },
              txt2: { text: '' },
              txt3: { text: '' },
              txt4: { text: '' },
              txt5: { text: '' },
              txt6: { text: '' },
              txt7: { text: '' },
              txt8: { text: '' },
              txt9: { text: '' },
              txt10: { text: '' },
              txt11: { text: '' },
              txt12: { text: '' },
          }
          if leancanvas.save
            render json: { status: 'SUCCESS', product_id: leancanvas.product_id }
          else
            render json: { status: 'FAILED' }
          end
        else
          render json: { status: 'FAILED' }
        end
      end

      def update
        leancanvas = LeanCanvas.find_by(product_id: params[:product_id])
        if leancanvas.update_attributes(board_texts: text_params)
          render json: { status: 'SUCCESS', product_id: leancanvas.product_id , board_texts: leancanvas.board_texts }
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
              txt9: [:text ],
              txt10: [:text ],
              txt11: [:text ],
              txt12: [:text ]
          )
        end
    end
  end
end
