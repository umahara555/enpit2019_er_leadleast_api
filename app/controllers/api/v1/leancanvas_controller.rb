module Api
  module V1
    class LeancanvasController < ApplicationController
      # 一覧を取得
      def index
        render json: { status: 'SUCCESS', leancanvasies: LeanCanvas.all }
      end

      def create
        leancanvas = LeanCanvas.new(text_params)
        if leancanvas.save
          render json: { status: 'SUCCESS', product_id: leancanvas.product_id , board_texts: leancanvas.board_texts}
        else
          render json: { status: 'FAILED' }
        end
      end

      # パラメータを取得する
      private
        def text_params
          params.require(:leancanvas).permit(
            :product_id, 
            board_texts: [
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
            ]
          )
        end
    end
  end
end
