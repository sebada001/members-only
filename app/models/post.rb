class Post < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { minimum: 4 }
    validates :body, presence: true, length: { minimum: 6 }
    validates :user_id, presence: true
end
