class ReservesController < ApplicationController
  before_action :authenticate_user!
  
  def index #予約ルーム一覧
    @user = User.find_by(id: current_user.id)
    @rooms = Room.all
    @reserves = Reserve.where(user_id: current_user.id ) #userごとに予約履歴確認
  end
  
  def confirm #予約確認画面
    @user = User.find_by(id: current_user.id)
    @room = Room.find(params[:room_id])
    @reserve = Reserve.new(reserve_params)
    if @reserve.save(validate: true)
      redirect_to '/reserves/new' if @reserve.invalid?
    else
      flash[:notice] = "必須項目を全て入力してください。チェックアウトはチェックインの日付より後に設置してください。"
      redirect_to "/rooms/#{params[:room_id]}"
    end
    
  end
  
  def update
    @user = User.find_by(id: current_user.id)
    @reserve = Reserve.new(reserve_params)
  end
  
  def destroy
      @reserve = Reserve.find(params[:id])
      @reserve.destroy
      flash[:notice] = "予約情報を削除しました"
      redirect_to :reserves
  end
  
  private
    def reserve_params
      params.permit(:begin, :end, :number_of_peple, :room_id, :total).merge(user_id: current_user.id)
    end
    
end
