class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites

  is_impressionable counter_cache: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # ソート用のインスタンスメソッド
  def self.sort(selection)
    case selection
    when 'new'
      all.order(created_at: :DESC)
    when 'old'
      all.order(created_at: :ASC)
    when 'likes'
      find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    when 'dislikes'
      find(Favorite.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
    when 'pvmany'
      order('impressions_count desc').all
    when 'pvless'
      order('impressions_count asc').all
    end
  end

end
