class ApplicationController < ActionController::Base
  # ↓　ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしてもログイン画面へリダイレクトするようになる
  # ↓　ログイン認証が済んでいる場合には全てのページにアクセスすることができる
  before_action :authenticate_user!, except: [:top]


  before_action :configure_permitted_parameters, if: :devise_controller?

# after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移(せんい)するかを設定しているメソッド
  def after_sign_in_path_for(resource)
    # rails routesで確認
    # indexにする
    post_images_path
  end

# fter_sign_out_path_forはafter_sign_in_path_forと同じくDeviseが用意しているメソッドで
# サインアウト後にどこに遷移するかを設定するメソッド
  def after_sign_out_path_for(resource)
    about_path
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



end



