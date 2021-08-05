class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  belongs_to :role
  belongs_to :wallet

  validates_presence_of :name, :role_id
  validates_uniqueness_of :uid, scope: :provider
  validates :email, :uniqueness => {:allow_blank => true}

  default_scope { order('name ASC') }

  def role?(role_sym)
    role.name.downcase.gsub(/( )/, '_').to_sym == role_sym
  end

  def is_admin?
    role? :administrator
  end
end
