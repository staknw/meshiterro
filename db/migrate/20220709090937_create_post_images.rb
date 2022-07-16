class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    # create_table :テーブル名
    create_table :post_images do |t|
      # t.データ型 :カラム名
      t.string :title
      t.string :body
      t.text :caption
      t.string :shop_name
      t.integer :user_id
      # id追加してrails db:migrateしたらエラーになった

      t.timestamps
    end
  end
end
