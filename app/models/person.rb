# Author: Preston Lee
class Person < ActiveRecord::Base
	
	extend FriendlyId
	friendly_id :name, use: :slugged


  	validates_presence_of :name

	has_attached_file	:avatar, :styles => { large: '400x400>', medium: '200x200>', small: '100x100>' }, :default_url => "/assets/user.png"

end
