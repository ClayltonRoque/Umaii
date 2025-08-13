require 'rails_helper'

RSpec.describe User, type: :model do
  it 'é inválido sem nome' do
    user = User.new(email: 'teste@email.com', password: '123456', user_type: 'cliente')
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include('não pode ficar em branco')
  end

  it 'é inválido sem email' do
    user = User.new(name: 'Teste', password: '123456', user_type: 'cliente')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include('não pode ficar em branco')
  end

  it 'é inválido sem password' do
    user = User.new(name: 'Teste', email: 'teste@email.com', user_type: 'cliente')
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include('não pode ficar em branco')
  end

  it 'é inválido sem user_type' do
    user = User.new(name: 'Teste', email: 'teste@email.com', password: '123456')
    expect(user).not_to be_valid
    expect(user.errors[:user_type]).to include('é obrigatório informar o tipo de usuário')
  end

  it 'é válido com todos os campos obrigatórios' do
    user = User.new(name: 'Teste', email: 'teste@email.com', password: '123456', user_type: 'cliente')
    expect(user).to be_valid
  end
end
