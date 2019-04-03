class EventVenue < ApplicationRecord
	validates :name, length: { minimum: 20, message: "The Event Venue's name must have at least 20 characters." }

	validates :capacity, numericality: { greater_than: 0, message: "The Event Venue's capacity must be a positive number." }

end
