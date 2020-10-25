class User < ApplicationRecord
  validates :name, length: { maximum: 20 }
  validates :name, length: { minimum: 2 }
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
