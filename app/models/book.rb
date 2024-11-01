class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :body, presence: true
  validates :title, presence: true
  
end
