class AdminUser < ApplicationRecord
	#self.table_name = "lrv_admin_users"
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits
end

admin = AdminUser.new
admin.first_name= 'Kevin'
admin.first_name
