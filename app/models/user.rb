class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ア-ン]+\z/ }
  validates :birthdate, presence: true
end
