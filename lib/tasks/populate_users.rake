namespace :db do
  task populate_users: :environment do

    User.destroy_all

    20.times do
      User.create(
      first_name: Faker::Name.first_name, 
      last_name:  Faker::Name.last_name
      )
    end

  end
end