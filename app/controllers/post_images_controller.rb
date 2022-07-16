class PostImagesController < ApplicationController
  def new
    # 空のモデルを用意
    @post_image = PostImage.new
  end

# 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id

    # {f式を使って対象のカラム(ここではimageとshop_name)にデータが保存された場合はsaveメソッド(@post_image.save)がtrueになり
    # 今まで通りredirect_toによりリダイレクト処理が走り
    # バリデーションなどにより保存できなかった場合はsaveメソッドがfalseになり
    # renderによりpost_images/new.html.erbが表示され投稿ページを再表示するように設定する}
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    # @post_images = PostImage.all　を書き直す　↓
    # kaminariをインストールしてpageメソッドが使えるようになった
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    # コメントを投稿するためのインスタンス変数を定義する↓
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to 'post_images_path'
  end
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
