Rails.application.routes.draw do

	devise_for :users

	resources :people
	resources :publications
	resources :partners
	resources :experiments

	root :to => "experiments#index"

	get	'contact'	=> 'welcome#contact',	:as => :contact

end
