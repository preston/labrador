class PublicationsController < InheritedResources::Base

	before_filter	:set_friendly_resource,	only: [:show, :edit, :update, :destroy]

	before_filter	:require_admin, :except => [:index]

	# GET /publications
	# GET /publications.xml
	def index
		@publications = Publication.order('year DESC, citation ASC')
		index!
	end


	private

	# Use callbacks to share common setup or constraints between actions.
	def set_friendly_resource
		@publication = Publication.friendly.find(permitted_params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def permitted_params
		params.permit(:id, publication: [:citation, :year, :url])
	end

end
