User.destroy_all
Species.destroy_all


emma = User.create(name:'emma', username: 'efewer', bio: "hi, I'm emma.", city: 'Glasgow, MT')
dave = User.create(name:'dave', username: 'dwisecar', bio: "hi, I'm dave.", city: 'Seattle, WA')
adam = User.create(name:'adam')
emiley = User.create(name:'emiley')


10.times do
    Species.create(name:Faker::Creature::Animal.name)
end 

20.times do
    Pet.create(name:Faker::Name.first_name, age: 4, user_id: User.all.sample.id, species_id: Species.all.sample.id)
end 

5.times do
    Post.create(title:Faker::Quote.singular_siegler, content:Faker::Quote.most_interesting_man_in_the_world, user_id: User.all.sample.id)
end