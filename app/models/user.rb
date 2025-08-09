class User < ApplicationRecord
  validates :name, presence: { message: "não pode ficar em branco" }
  validates :user_type, presence: { message: "é obrigatório informar o tipo de usuário" }
  has_many :orders
end
