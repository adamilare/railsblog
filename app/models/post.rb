class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter
  before_destroy :perform_cleanup

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
  
  private
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def perform_cleanup
    # to handle all associated entries
  end
end
