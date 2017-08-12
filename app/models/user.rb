class User < ApplicationRecord
	attr_accessor :password
	before_save :encrypt_password

	has_many :parts

	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :password, confirmation: true
	validates_uniqueness_of :email
	validates :password, length: {minimum: 8, maximum: 30}

	# before_create { generate_token(:auth_token) }

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def self.search(query)
		where("name like ? OR email like ?", "%#{query}", "%#{query}%")
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end
