class User < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :invites, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
