class Section < ApplicationRecord

	belongs_to :page, { :optional => true }
	has_many :section_edits
	has_many :admin_users, :through => :section_edits
end
