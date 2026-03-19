class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
end
