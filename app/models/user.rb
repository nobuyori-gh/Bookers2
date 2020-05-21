class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: {in:2..20}
  validates :introduction, length: {maximum: 50}

  has_many :books, dependent: :destroy
  # User1に対して複数のbooksインスタンスを持つ
  # dependent: :destroyの意味
  # Userクラスが消えると、Bookモデルのbooksインスタンスも消える
  attachment :profile_image

  def posts
  return Book.where(user_id: self.id)
  end
end