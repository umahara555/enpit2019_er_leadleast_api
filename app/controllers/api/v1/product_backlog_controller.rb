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
          data = { status: 'SUCCESS', product_id: product_backlog.product_id , board_texts: product_backlog.board_texts }
          # SyncProductBacklogJob.perform_later(data.to_json)
          render json: data
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
              txt9: { text: '' },
              txt10: { text: '' },
              txt11: { text: '' },
              txt12: { text: '' },
              txt13: { text: '' },
              txt14: { text: '' },
              txt15: { text: '' },
              txt16: { text: '' },
              txt17: { text: '' },
              txt18: { text: '' },   
              txt19: { text: '' },
              txt20: { text: '' },
              txt21: { text: '' },
              txt22: { text: '' },
              txt23: { text: '' },
              txt24: { text: '' },
              txt25: { text: '' },
              txt26: { text: '' },
              txt27: { text: '' },
              txt28: { text: '' },
              txt29: { text: '' },
              txt30: { text: '' },
              txt31: { text: '' },
              txt32: { text: '' },
              txt33: { text: '' },
              txt34: { text: '' },
              txt35: { text: '' },
              txt36: { text: '' },                            
              txt37: { text: '' },
              txt38: { text: '' },
              txt39: { text: '' },
              txt40: { text: '' },
              txt41: { text: '' },
              txt42: { text: '' },
              txt43: { text: '' },
              txt44: { text: '' },
              txt45: { text: '' },
              txt46: { text: '' },
              txt47: { text: '' },
              txt48: { text: '' },
              txt49: { text: '' },
              txt50: { text: '' },
              txt51: { text: '' },
              txt52: { text: '' },
              txt53: { text: '' },
              txt54: { text: '' },              
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
          data = { status: 'SUCCESS', product_id: product_backlog.product_id , board_texts: product_backlog.board_texts }
          SyncProductBacklogJob.perform_later(product_backlog.product_id, data.to_json)
          render json: data
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
              txt12: [:text ],
              txt13: [:text ],
              txt14: [:text ],
              txt15: [:text ],
              txt16: [:text ],
              txt17: [:text ],
              txt18: [:text ],             
              txt19: [:text ],
              txt20: [:text ],
              txt21: [:text ],
              txt22: [:text ],
              txt23: [:text ],
              txt24: [:text ],
              txt25: [:text ],
              txt26: [:text ],
              txt27: [:text ],
              txt28: [:text ],
              txt29: [:text ],
              txt30: [:text ],
              txt31: [:text ],
              txt32: [:text ],
              txt33: [:text ],
              txt34: [:text ],
              txt35: [:text ],
              txt36: [:text ],
              txt37: [:text ],                
              txt38: [:text ],
              txt39: [:text ],
              txt40: [:text ],
              txt41: [:text ],
              txt42: [:text ],
              txt43: [:text ],
              txt44: [:text ],
              txt45: [:text ],
              txt46: [:text ],
              txt47: [:text ],
              txt48: [:text ],
              txt49: [:text ],
              txt50: [:text ],
              txt51: [:text ],
              txt52: [:text ],
              txt53: [:text ],
              txt54: [:text ],                     
          )
        end
    end
  end
end
