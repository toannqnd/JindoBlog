# sudo gem install faker
# hoặc thêm => gem 'faker',  '1.4.2' => vào gemfile

User.create!(name:                    "Jindo Kuyo",
              email:                  "toannq@nal.vn",
              password:               "f732@d99fk",
              password_confirmation:  "f732@d99fk",
              admin:                  true,
              activated:              true,
              activated_at:           Time.zone.now)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:                   name,
               email:                  email,
               password:               password,
               password_confirmation:  password)
end