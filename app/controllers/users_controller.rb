class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @post_images = @user.post_imagesを書き直す　↓
    # ここのshowアクションでもユーザーに関連付いたPostImageを取得しているので、(app/controllers/post_images_controller.rb)と同じように追記する
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # ↓カッコ内@users.idじゃない
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
