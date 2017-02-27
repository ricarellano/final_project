class User < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :destinations, dependent: :destroy
  has_many :directions, dependent: :destroy
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
