# Author: Preston Lee
class Publication < ActiveRecord::Base

	extend FriendlyId
	friendly_id :citation, use: :slugged

	validates_presence_of :citation
	validates_presence_of :year
	validates_numericality_of :year

end
