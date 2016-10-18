class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :commenter_id
  has_many :commented_on_posts, through: :posts, source: :comments

  validates :username, presence: true
  validates :username, uniqueness: true
  validate :validate_password



  def password
    @password ||= BCrypt::Password.new(self.password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user_to_authenticate = User.find_by(username: username)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 5
      errors.add(:password, "must be greater than 5 characters")
    end
  end
end
