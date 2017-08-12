class Contact < ApplicationRecord
	# belongs_to :users
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
