System.create!(
	title: 'Preston Lee Ventures',
	subtitle: 'Business, Technology and Entrepreneurship',
	about: '',
	copyright_link: 'http://www.prestonlee.com',
	copyright_holder: 'Preston Lee'
)

n = 5
(1..n).each do |i|
	e = Experiment.new({
			:name				=> "Project #{i}",
			:description 		=> "Description #{(i.to_s + ' ') * 100 }",
			:home_url		 	=> "http://google.com/s?q=project#{i}",
			:issues_url	 		=> "http://example.com/issues",
			:source_url	 		=> "http://github.com",
			:documentation_url	=> "http://example.com/documentation",
			:download_url		=> "http://www.labrador.org/images/header_left_homepage.gif",
			:contact			=> "Preston Lee",
			:meta_keywords		=> "some keywords",
			:meta_description	=> "some description"
			})
		e.save!
end

Partner.create!(name: 'ASU', description: 'Arizona State University' url: 'http://www.asu.edu')

admin = User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
admin.confirmed_at = Time.now
admin.admin = true
admin.save!
