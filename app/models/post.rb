class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  is_impressionable counter_cache: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.sort_date(date)
    return all.order(created_at: :DESC) if date == 'new'
    return all.order(created_at: :ASC) if date == 'old'
  end

  def self.sort_favorite(favorite)
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id)) if favorite == 'likes'
    return find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id)) if favorite == 'dislikes'
  end

  def self.sort_pv(pv)
    return order('impressions_count desc').all if pv == 'pvmany'
    return order('impressions_count asc').all if pv == 'pvless'
  end

end
