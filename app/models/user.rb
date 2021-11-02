class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:survey_creator, :survey_taker]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
