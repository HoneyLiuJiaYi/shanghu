class Station < ApplicationRecord
  belongs_to :address
  belongs_to :region
  belongs_to :merchant

  has_many :rider_stationships
  has_many :riders, :through => :rider_stationships
end
