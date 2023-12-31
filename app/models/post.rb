class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :post_counter
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def top_5_comment
    comments.order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    author.increment!(:post_counter)
  end
end
