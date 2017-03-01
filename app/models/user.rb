class User < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_secure_password

validates :email, presence: true, uniqueness: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
