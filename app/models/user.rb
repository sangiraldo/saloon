class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Validations

  validates :full_name, :email, presence: true
  validates_presence_of :full_name, :email, :cellphone, :address, unless: -> { from_omniauth? }

  # Methods

  def is_admin?
    return true if is_admin
  end

  def self.from_omniauth(auth)
    if where(email: auth.info.email).exists?
      user = find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.full_name = auth.info.name
      user.save
    elsif where(provider: auth.provider, uid: auth.uid).exists?
      user = find_by(provider: auth.provider, uid: auth.uid)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name
      user.save
    else
      user = where(provider: auth.provider, uid: auth.uid).create do |u|
        u.email = auth.info.email
        u.password = Devise.friendly_token[0,20]
        u.full_name = auth.info.name
      end
    end
    user
  end


  def from_omniauth?
   provider && uid
  end
end
