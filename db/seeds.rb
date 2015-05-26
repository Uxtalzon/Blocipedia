require 'faker'

member = User.new(
  name:     'Member User',
  email:    'member@example.com',   password: 'helloworld'
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