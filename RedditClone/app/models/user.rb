class User < ActiveRecord::Base
  attr_reader :password

  validates :name, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :session_token, :name, uniqueness: true

  before_validation :ensure_session_token

  has_many(
    :subs,
    class_name: "Sub",
    foreign_key: :moderator_id,
    primary_key: :id,
    inverse_of: :moderator
  )

  has_many :posts, inverse_of: :author
  has_many :comments, inverse_of: :author
  has_many :user_votes, inverse_of: :user



  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def find_by_credentials(name, password)
    user = User.find_by(name: name)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
