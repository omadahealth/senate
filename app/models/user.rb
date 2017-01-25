class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  # :registerable, :recoverable, :rememberable, :validatable
  devise :ldap_authenticatable, :trackable, :timeoutable,
         authentication_keys: [:username]

  validates :username, presence: true
end
