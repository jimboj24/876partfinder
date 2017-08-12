class Part < ApplicationRecord
	# belongs_to :users
	acts_as_paranoid
	mount_uploader :image, ImageUploader

	validates :part_name, presence: true
	validates :email_address, presence: true
	validates :email_address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
