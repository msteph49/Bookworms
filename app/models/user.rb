class User < ApplicationRecord
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   validates :usermane, :uniqueness
    # validates :email, :uniqueness
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :lockable

    # devise :omniauthable, omniauth_providers: [:google_oauth2]

    has_many :reviews, dependent: :destroy
    has_many :books, through: :reviews
       
    validates :name, :username, presence: true 

    validates :username, uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 30}, 
        format: { with: /\A[A-z0-9_]*\z/i }

    def to_s
      "@#{username}"
    end

    def login
      @login || self.username || self.email
    end

    def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end
