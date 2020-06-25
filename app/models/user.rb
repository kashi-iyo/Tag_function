class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :posts

  has_many :tweets, dependent: :destroy

  def feed
    Post.where("user_id = ?", id)
  end
end
