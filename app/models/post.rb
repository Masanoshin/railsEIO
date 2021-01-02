class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    mount_uploader :img, ImgUploader
    # belongs_to :user
    has_many :coments, dependent: :destroy
    default_scope -> { order(created_at: :desc) }
    # validate :img_size  サイズの確認するGEMファイルが必要説

    private
     # アップロードされた画像のサイズをバリデーションする
  def img_size
    if img.size > 5.megabytes
      errors.add(:img, "should be less than 5MB")
    end
  end
end
