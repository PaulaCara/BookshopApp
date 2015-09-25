class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  # :confirmable, :recoverable, :rememberable, :trackable, :registerable
  devise :database_authenticatable, :validatable
  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation
  # has_secure_password

  has_one :cart
  validates :email, presence: true, uniqueness: true

  def is_admin?
      admin
  end
end
