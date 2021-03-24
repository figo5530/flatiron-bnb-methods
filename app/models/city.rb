class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods


  def city_openings(starting_date, ending_date)
    Listing.joins(:reservations).where.not(reservations: {checkin: starting_date..ending_date})
    Listing.joins(:reservations).where.not(reservations: {checkout: starting_date..ending_date})
  end
end

