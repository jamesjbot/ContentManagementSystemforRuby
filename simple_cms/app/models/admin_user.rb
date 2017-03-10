class AdminUser < ApplicationRecord
	#self.table_name = "lrv_admin_users"
	has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9]+\.[a-z]{2,4}\Z/i
	FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

	validates :first_name,  :presence => true,
							:length => { :maximum => 25 }
	validates :last_name, 	:presence => true,
							:length =>  {:maximum => 50 }
	validates :username,  	:presence => true,
							:length => {:within => 8..25},
							:uniqueness => true						
	validates :email, 		:presence => true,
							:length => {:maximum => 100 },
							:format => {:with => EMAIL_REGEX},
							:confirmation => true

	validate :username_is_allowed

	validate :no_new_users_monday, :on => :create

	scope :sorted, lambda {order('last_name ASC, first_name ASC')}


	def name
		# This uses string interpolation to get data out of the model
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@admin_user name function called@@@@@@@@@@@@@@@@@@@@@@@@@@")
		"#{first_name} #{last_name}"
		# or first_name + ' ' + last_name
		# or [first_name, last_name].join(' ')
	end

	private
	def username_is_allowed
		if FORBIDDEN_USERNAMES.include?(username)
			errors.add(:username, "has been restricted from use.")
		end
	end

	def always_a_problem
		errors.add(:username, "always causes a problem.")
	end

	def no_new_users_monday
	
		if Time.now.wday == 1
			errors.add(:base, "No new users on Mondays.")
		end
	end



	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 25
	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 50
	# validates_presence_of :username
	# validates_length_of :username, :within => 8..25
	# validates_uniqueness_of :username
	# validates_presence_of :email
	# validates_length_of :email, :maximum => 100
	# validates_format_of :email, :with => EMAIL_REGEX
	# validates_confirmation_of :email

end

# admin = AdminUser.new
# admin.first_name= 'Kevin'
# admin.first_name
