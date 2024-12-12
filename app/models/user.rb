class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products

  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/,
                                 message: 'is invalid. Include both letters and numbers' }
  validates :nickname, presence: true
  validates :last_name, presence: true,
                        format: {
                          with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                          message: 'is invalid. Input full-width characters'
                        }
  validates :first_name, presence: true,
                         format: {
                           with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                           message: 'is invalid. Input full-width characters'
                         }
  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[ァ-ヶ-]+\z/,
                               message: 'is invalid. Input full-width katakana characters'
                             }
  validates :first_name_kana, presence: true,
                              format: {
                                with: /\A[ァ-ヶ-]+\z/,
                                message: 'is invalid. Input full-width katakana characters'
                              }
  validates :birthdate, presence: true
end
