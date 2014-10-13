# Author: Preston Lee
class Partner < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates_presence_of :name

end
