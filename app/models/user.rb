class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :overtimes, dependent: :destroy    #残業申請テーブル
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                                    format: {with: VALID_EMAIL_REGEX},
                                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :department, length: {in: 3..5}, allow_blank: true
end
