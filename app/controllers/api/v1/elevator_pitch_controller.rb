module Api
  module V1
    class ElevatorPitchController < ApplicationController
      # 一覧を取得
      def index
        render json: { status: 'SUCCESS', elevator_pitches: ElevatorPitch.all }
      end

      def show
        elevator_pitch = ElevatorPitch.find_by(product_id: params[:product_id])
        if elevator_pitch.present?
          data = { status: 'SUCCESS', product_id: elevator_pitch.product_id , board_texts: elevator_pitch.board_texts }
          # SyncElevatorPitchJob.perform_later(data.to_json)
          render json: data
        else
          render json: { status: 'FAILED' }
        end
      end

      def create
        if ElevatorPitch.find_by(product_id: params[:product_id]).blank?
          elevator_pitch = ElevatorPitch.new()
          elevator_pitch.product_id = params[:product_id]
          elevator_pitch.board_texts = {
              txt1: { text: '' },
              txt2: { text: '' },
              txt3: { text: '' },
              txt4: { text: '' },
              txt5: { text: '' },
              txt6: { text: '' },
              txt7: { text: '' },
          }
          if elevator_pitch.save
            render json: { status: 'SUCCESS', product_id: elevator_pitch.product_id }
          else
            render json: { status: 'FAILED' }
          end
        else
          render json: { status: 'FAILED' }
        end
      end

      def update
        elevator_pitch = ElevatorPitch.find_by(product_id: params[:product_id])
        if elevator_pitch.update_attributes(board_texts: text_params)
          data = { status: 'SUCCESS', product_id: elevator_pitch.product_id , board_texts: elevator_pitch.board_texts }
          SyncElevatorPitchJob.perform_later(elevator_pitch.product_id, data.to_json)
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
          )
        end
    end
  end
end
