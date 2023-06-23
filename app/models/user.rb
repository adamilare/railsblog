class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, :photo, :bio, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :generate_api_key

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end

  def generate_api_key
    self.api_key = loop do
      random_token = SecureRandom.alphanumeric(20)
      break random_token unless User.exists?(api_key: random_token)
    end

    puts '', 'api_key ------------', api_key, '-----------------', ''

    save
  end
end
