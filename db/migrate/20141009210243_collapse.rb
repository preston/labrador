class Collapse < ActiveRecord::Migration

	create_table "system", force: true do |t|
		t.string   "title",	null: false
		t.string   "subtitle",	null: false
		t.string   "about", null: false
		t.string   "copyright_holder", null: false
		t.string   "copyright_link", null: false
	end

	create_table "experiments", force: true do |t|
		t.string   "name",                            null: false
		t.string   "description",        limit: 4096, null: false
		t.string   "home_url",                        null: false
		t.string   "issues_url"
		t.string   "source_url"
		t.string   "documentation_url"
		t.string   "contact"
		t.string   "meta_keywords"
		t.string   "meta_description"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "download_url"
		t.string   "slug"
		t.string   "image_file_name"
		t.string   "image_content_type"
		t.integer  "image_file_size"
		t.datetime "image_updated_at"
	end

	add_index "experiments", ["description"], name: "index_experiments_on_description"
	add_index "experiments", ["name"], name: "index_experiments_on_name"

	create_table "partners", force: true do |t|
		t.string   "name",        limit: 64,   null: false
		t.string   "description", limit: 1024
		t.string   "url"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "slug"
	end

	create_table "people", force: true do |t|
		t.string   "name",                limit: 64,    null: false
		t.string   "biography",           limit: 16384
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "slug"
		t.string   "avatar_file_name"
		t.string   "avatar_content_type"
		t.integer  "avatar_file_size"
		t.datetime "avatar_updated_at"
	end

	create_table "publications", force: true do |t|
		t.string   "citation",   limit: 4096, null: false
		t.integer  "year",                    null: false
		t.string   "url"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string   "slug"
	end

	create_table :users, force: true do |t|
		t.boolean :admin, default: false

		## Database authenticatable
		t.string :email,              :null => false, :default => ""
		t.string :encrypted_password, :null => false, :default => ""

		## Recoverable
		t.string   :reset_password_token
		t.datetime :reset_password_sent_at

		## Rememberable
		t.datetime :remember_created_at

		## Trackable
		t.integer  :sign_in_count, :default => 0, :null => false
		t.datetime :current_sign_in_at
		t.datetime :last_sign_in_at
		t.string   :current_sign_in_ip
		t.string   :last_sign_in_ip


		## Confirmable
		t.string   :confirmation_token
		t.datetime :confirmed_at
		t.datetime :confirmation_sent_at
		t.string   :unconfirmed_email # Only if using reconfirmable

		
		## Lockable
		# t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
		# t.string   :unlock_token # Only if unlock strategy is :email or :both
		# t.datetime :locked_at


		# Uncomment below if timestamps were not included in your original model.
		t.timestamps
	end

	add_index :users, :email,                :unique => true
	add_index :users, :reset_password_token, :unique => true
	add_index :users, :confirmation_token,   :unique => true
	# add_index :users, :unlock_token,         :unique => true

end
