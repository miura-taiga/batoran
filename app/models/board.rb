class Board < ApplicationRecord
  belongs_to :user
  validates :store_name, presence: true, length: { maximum: 255 }
  validates :product_name, presence: true, length: { maximum: 255 }
  validates :jan_code, presence: true, length: { maximum: 13 }
  validates :expiration_date, presence: true
end
