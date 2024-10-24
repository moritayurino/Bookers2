class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :body, presence: true
  validates :title, presence: true
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_imaage.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
