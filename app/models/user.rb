class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :recipes

  validates_presence_of :encrypted_password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  validates_format_of :password, with: /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).+/,
      message: "must contain upper- and lower-case characters and 1 or more numbers"
  validates :password, :length => {:within => 8..40}
end
