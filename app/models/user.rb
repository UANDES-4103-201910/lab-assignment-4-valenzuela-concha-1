class User < ApplicationRecord
  has_many :orders

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :phonenumber, 
  	length: { in: 9..12,
  	too_long: "The user phone number must have no more than %{count} characters.",
  	too_short: "The user phone number must have at least %{count} characters."}, 
  	numericality: { message: "The phonenumber must be numberical" } 
  
  validates :password, length: { in: 8..12, 
  	too_short: "The user passoword must have at least %{count} characters.",
    too_long: "The user password must have no more than %{count} characters."},
    format: {with: /\A[\sa-z0-9]+\Z/i, 
    message: "The password must be alphanumeric"}
    
end
