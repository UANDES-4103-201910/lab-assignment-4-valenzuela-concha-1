class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validate :start_date_after_current_date
  validate :schedule_order

  private def start_date_after_current_date
    return if start_date.blank?

    if Date.today > start_date
      errors.add(:start_date, "must be after the current date")
    end

  end

  private def schedule_order
  	return if start_date.blank?
    for e in Event.all do
    	if e[:event_venue] == event_venue || e[:start_date] == start_date
    		errors.add(:start_date, "There's already an existing event on that venue in that date.")
		end
	end


  end


end
