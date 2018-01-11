class UserIconsController < ApplicationController
  before_action :set_user_icon, only:[:edit, :update]

  def new
    @user_icon = UserIcon.new
  end

  def create
    @user_icon = UserIcon.new(user_icon_params)
    if @user_icon.save
      redirect_to edit_user_registration_path, notice: "アイコンを更新しました"
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    @user_icon = UserIcon.find(params[:id])
    if @user_icon.update(user_icon_params)
      redirect_to edit_user_registration_path, notice: "アイコンを更新しました"
    else
      render 'new'
    end
  end


  private
  def set_user_icon
    @user_icon = UserIcon.find_by(user_id: params[:id])
  end

  def user_icon_params
    params.require(:user_icon).permit(:user_id, :image)
  end
end
