# Author: Preston Lee
class Experiment < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, use: :slugged

	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :contact
	validates_presence_of :home_url
	
	validates_uniqueness_of :name

	has_attached_file	:image, :styles => { large: '400x400>', medium: '200x200>', small: '100x100>' }, :default_url => "/assets/user.png"

end
