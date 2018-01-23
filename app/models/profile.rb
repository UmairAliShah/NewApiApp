class Profile < ApplicationRecord
  belongs_to :user


#  geocoded_by :address
 #  after_validation :geocode

#  def address
#    [city, code, address].compact.join(', ')
#  end


end
