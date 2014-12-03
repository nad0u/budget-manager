class User < ActiveRecord::Base
    has_many :budgets, dependent: :destroy
    validates :email, :username, :password_confirmation, presence: true

    attr_accessor :password
    before_save :encrypt_password
	validates_confirmation_of :password

	def encrypt_password
	self.password_salt = BCrypt::Engine.generate_salt
	self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end


    def self.authenticate(email, password)
      user = User.where(email: email).first
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil
      end
    end
	
	
	def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
    end
	
	
	end
