class Merchant < ApplicationRecord
  has_secure_password
  has_many :merchant_categoryships
  has_many :categories, :through => :merchant_categoryships
end
