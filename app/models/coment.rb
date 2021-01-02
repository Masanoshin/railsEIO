class Coment < ApplicationRecord
    validates :coment, presence: true, length: {minimum: 1}
    validates :user_id, presence: true
    validates :posted_id, presence: true
    
end
