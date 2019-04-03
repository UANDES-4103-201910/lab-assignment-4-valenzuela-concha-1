class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_create :ticket_before_event
  before_create :buy_ticket

  private def ticket_before_event
  	tt = TicketType.find(ticket_type_id)
  	e = Event.find(tt[:event_id])

  	if e[:start_date] < Date.today
  		errors.add(:created_at, "must be before the event's start date")
	end

  end

    private def buy_ticket
  	tt = TicketType.find(ticket_type_id)
  	e = Event.find(tt[:event_id])
  	o = Order.find(order_id)[:created_at]

  	if e[:start_date] < o
  		errors.add(:created_at, "The ticket cannot be bought, the event already ended or started")
	end

  end


end
