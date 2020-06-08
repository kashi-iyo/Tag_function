class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  is_impressionable

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

  def self.sort_pv_desc
    return find(Impression.group(:impressionable_id).order(Arel.sql('count(impressionable_id) desc')).pluck(:impressionable_id))

  end

  def self.sort_pv_asc
    return find(Impression.group(:impressionable_id).order(Arel.sql('count(impressionable_id) asc')).pluck(:impressionable_id))
  end
end
