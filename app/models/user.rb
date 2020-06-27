class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :posts

  has_many :tweets

  #フォローしているユーザー達とのアソシエーション
  has_many :relationships
  has_many :followings, through: :relationships,
                        source: :follow

  #フォローされているユーザー達とのアソシエーション
  has_many :reverse_of_relationships, foreign_key: "follow_id",
                                      class_name: "Relationship"

  has_many :followers, through: :reverse_of_relationships, source: :user

  #取得したユーザーをフォローしている場合はtrueを返す
  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
end
