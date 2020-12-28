class User < ApplicationRecord
    # before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 20}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 50},format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 6}, allow_nil:true
    validates :password, presence: true, length: {maximum: 15},  allow_nil:true
    has_secure_password    

    mount_uploader :img, ImgUploader

    def img_size
        if img.size > 5.megabytes
          errors.add(:img, "should be less than 5MB")
        end
      end
end
