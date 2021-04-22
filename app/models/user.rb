class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :joint_recipes, through: :saved_recipes, source: :recipe

  # validates :username, presence: true
  validates :username, :email, uniqueness: true
end
