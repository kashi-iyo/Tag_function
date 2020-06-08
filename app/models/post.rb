class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.sort_desc
    return all.order(created_at: :DESC)
  end

  def self.sort_asc
    return all.order(created_at: :ASC)
  end

  def self.sort_favorites_desc
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
  end

  def self.sort_favorites_asc
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
  end
end
