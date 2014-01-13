namespace :db do
  desc "Fill database with sample data"
    task populate: :environment do
      admin = User.create!(name: "wddwxy",
                           email: "wxy2008@yeah.net",
                           password: "123456",
                           password_confirmation: "123456",
                           admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   admin: false)
    end
  end
end