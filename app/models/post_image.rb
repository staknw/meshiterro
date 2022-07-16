class PostImage < ApplicationRecord
# 従属する側のモデルにbelongs_toを記述し、
# 従属させる側のモデルにhas_oneを記述する
# ここではpetと飼い主の関係で記述

# PostImageモデルにはActiveStoreageを使って画像を持たせるため以下追記
# userがimageを所有している関係
  has_one_attached :image

# petはuserによって所有されている(飼われている)
  belongs_to :user

# has_manyでPostCommentモデルを複数持つことを表している
  has_many :post_comments, dependent: :destroy

  # PostImageモデルに関連付けを追加する
  has_many :favorites, dependent: :destroy




# validatesで対象とする項目を指定、入力されたデータのpresence（存在）をチェックし
# trueと記述するとデータが存在しなければならないという設定になる
# shop_nameが存在しているかを確認するバリデーション
  validates :shop_name, presence: true
  # imageが存在しているかを確認するバリデーション
  validates :image, presence: true


# <% if list.image.attached? %>
    # <%= image_tag list.image, size: "200x200" %>
# <% else %>
    # <%= image_tag 'no_image', size: "200x200" %>
# <% end %>

# を簡単にまとめるえと、↓の書き方になる

# get_imageメソッド
  # def get_image
    # if image.attached?
      # image
    # else
      # 'no_image.jpg'
    # end
  # end

# これだとRailsで画像のサイズ変更を行うことができないから
# no_image.jpgをActiveStorageに格納するためにコードを次のように書き換え

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end




# favorited_by?メソッドを作成します。 このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。 存在していればtrue、存在していなければfalseを返すようにしています
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end











end
