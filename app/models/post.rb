class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.sort_favorites_desc
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(3).pluck(:post_id))
  end

  def self.sort_favorites_asc
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).limit(3).pluck(:post_id))
  end
end
