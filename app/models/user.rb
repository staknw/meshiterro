class User < ApplicationRecord
  # userモデルが定義されている
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# Userモデルに対してPostImageモデルが1:Nになるよう関連付ける
# has_manyメソッド↓直訳「たくさんpost_imageを持っている」
# dependent::destroyは「1:Nの1側が削除されたときN側を全て削除する」という機能が追加される.「Userが削除された時に、そのUserが投稿したPostImageが全て削除される」
  has_many :post_images, dependent: :destroy

# 1:Nの関係において、「1」のデータが削除された場合、関連する「N」のデータも削除される設定
  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image

# いいね
  has_many :favorites, dependent: :destroy

# 下の(width,height)を記述さないとエラーが出る
  def get_profile_image(width,height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
