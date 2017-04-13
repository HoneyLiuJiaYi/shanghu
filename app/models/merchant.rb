class Merchant < ApplicationRecord
  has_secure_password
  validates :mobile, :length => {:is => 6}
end
