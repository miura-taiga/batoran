class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :first_name, presence: true, length: { maximum: 255 }
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  has_many :boards

  has_many :comments, dependent: :destroy

  def own?(comment)
    self.id == comment.user_id
  end

end
