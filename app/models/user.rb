class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   validates :usermane, :uniqueness
    # validates :email, :uniqueness
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
    has_many :reviews
    has_many :books, through: :reviews
end
