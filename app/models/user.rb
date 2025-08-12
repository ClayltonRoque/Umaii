class User < ApplicationRecord
  before_create :generate_jti
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null,
         authentication_keys: [ :login ]

  validates :name, presence: { message: "não pode ficar em branco" }
  validates :user_type, presence: { message: "é obrigatório informar o tipo de usuário" }
  has_many :orders

  def login
    @login || self.name || self.email
  end

  private

  def generate_jti
    self.jti ||= SecureRandom.uuid
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where([ "lower(name) = :value OR lower(email) = :value", { value: login.downcase } ]).first
    else
      where(conditions.to_h).first
    end
  end
end
