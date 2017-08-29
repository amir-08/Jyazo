class Event < ApplicationRecord
	geocoded_by :address
after_validation :geocode, :if => :address_changed?


def self.search(search)
  if search
    self.where("event_name like ?", "%#{search}%")
  else
    self.all
  end
end
end
