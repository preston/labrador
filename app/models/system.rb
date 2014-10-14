class System < ActiveRecord::Base

	validates_presence_of	:title
	validates_presence_of	:subtitle
	validates_presence_of	:about
	validates_presence_of	:copyright_link
	validates_presence_of	:copyright_holder

end
