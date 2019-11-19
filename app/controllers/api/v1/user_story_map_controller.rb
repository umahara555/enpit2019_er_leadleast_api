module Api
  module V1
    class UserStoryMapController < ApplicationController
      # 一覧を取得
      def index
        render json: { status: 'SUCCESS', user_story_maps: UserStoryMap.all }
      end

      def show
        user_story_map = UserStoryMap.find_by(product_id: params[:product_id])
        if user_story_map.present?
          data = { status: 'SUCCESS', product_id: user_story_map.product_id , board_texts: user_story_map.board_texts }
          # SyncUserStoryMapJob.perform_later(data.to_json)
          render json: data
        else
          render json: { status: 'FAILED' }
        end
      end

      def create
        if UserStoryMap.find_by(product_id: params[:product_id]).blank?
          user_story_map = UserStoryMap.new()
          user_story_map.product_id = params[:product_id]
          user_story_map.board_texts = {
            group1: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group2: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group3: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group4: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group5: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group6: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group7: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
            group8: {
                txt1: { text: '', } ,
                txt2: { text: '', } ,
                txt3: { text: '', } ,
                txt4: { text: '', } ,
                txt5: { text: '', } ,
                txt6: { text: '', } ,
            },
          }
          if user_story_map.save
            render json: { status: 'SUCCESS', product_id: user_story_map.product_id }
          else
            render json: { status: 'FAILED' }
          end
        else
          render json: { status: 'FAILED' }
        end
      end

      def update
        user_story_map = UserStoryMap.find_by(product_id: params[:product_id])
        if user_story_map.update_attributes(board_texts: text_params)
          data = { status: 'SUCCESS', product_id: user_story_map.product_id , board_texts: user_story_map.board_texts }
          SyncUserStoryMapJob.perform_later(data.to_json)
          render json: data
        else
          render json: { status: 'FAILED' }
        end
      end

      # パラメータを取得する
      private
        def text_params
          params.require(:board_texts).permit(
            group1:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group2:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group3:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group4:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group5:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group6:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group7:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
            ],
            group8:[
              txt1: [:text ],
              txt2: [:text ],
              txt3: [:text ],
              txt4: [:text ],
              txt5: [:text ],
              txt6: [:text ],
          ],
          )
        end
    end
  end
end
