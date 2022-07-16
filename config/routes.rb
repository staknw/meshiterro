Rails.application.routes.draw do
  # devise_orsersはdeviseを使用する際にURLとしてsersを含むことを示している。
  # root to: "homes#top"
  root to: 'homes#top'
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"


# 「rails g controller PostImages new index show」したらまとめてできた
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
# 上の三つをまとめて書く↓
  resources :post_images, only: [:new, :create, :index, :show, :destroy]do
    # コメントは投稿画像に対してコメントされるためpost_commentsは、post_imagesに結びつくからdoでつなげる
    resource :favorites, only: [:create, :destroy]
    # コメント削除機能を実装するため下にdestoroyを追加する
    resources :post_comments, only: [:create, :destroy]
  end
  # 「rails g controller users show edit」したらまとめてできた
  # get 'users/show'
  # get 'users/edit'
  # 上の二つをまとめて書く↓
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
