class Order < ApplicationRecord
  has_many :orderstations
  has_many :stations, :through => :orderstations
end