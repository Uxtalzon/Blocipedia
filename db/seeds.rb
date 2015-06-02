require 'faker'

member = User.new(
  name:     'Member User',
  email:    'member@example.com',   password: 'helloworld',
  role:     'standard'
  )
member.skip_confirmation!
member.save!

member = User.new(
  name:    'Admin User',
  email:   'admin@example.com',  password: 'helloworld',
  role:    'admin'
  )  
member.skip_confirmation!
member.save!

member = User.new(
  name:    'Premium User',
  email:   'premium@example.com',  password: 'helloworld',
  role:    'premium'
  )  
member.skip_confirmation!
member.save!

10.times do
  wiki = Wiki.new(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.sentence,
    private: false
    )
  wiki.save!
end

puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"