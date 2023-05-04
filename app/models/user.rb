class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :participants, dependent: :destroy
  scope :all_except, ->(user) { where.not(id: user) }
  validates :email, presence: true, format: Devise.email_regexp

  after_create_commit { broadcast_append_to "users" }

  def username
    return self.email.split('@').first
  end
end
