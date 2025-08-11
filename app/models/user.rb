class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null
  validates :name, presence: { message: "não pode ficar em branco" }
  validates :user_type, presence: { message: "é obrigatório informar o tipo de usuário" }
  has_many :orders
end
