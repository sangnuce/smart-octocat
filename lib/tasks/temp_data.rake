namespace :db do
	desc "Create temp data"
	task temp_data: :environment do
		10.times do |n|
			Room.create! chatwork_id: Faker::Number.number(8), name: Faker::HarryPotter.character,
				project_github_link: Faker::Internet.url
		end
	end
end
