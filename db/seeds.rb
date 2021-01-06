# User.destroy_all
Species.destroy_all

animals = ["cat","dog","turtle","bird","bunny"]

# emma = User.create(name:'emma', username: 'efewer', bio: "hi, I'm emma.", city: 'Glasgow, MT', image: "https://lh3.googleusercontent.com/fife/ABSRlIqy_duQvqtSrmKbrKrbU8tvqlgE58UnUnamfETxbgLr8MLTwarTcmmnTokU7LEhX7lLVw8RxnPRCCVm-U24-HOspaL22NiE6InDbNM85EBBwkWnV12pRlrbQfBnRc9fmyW-WIQREvqRvhM-EFy4Z6pH6g_aTZvZM6OcMOBsBXoUzlgYqQZWIODRIQZPk0qaFkZ5Q_L2EeB8gsuDxPiB1tXXkc-fmAwtJZnnnCNcmkaG0gEoz2QEOwYVK1G5D9N-iQIEmsxGrkad-sq1UH3m9g_A9A_Fn231so53h8cD7vAPFd15dj6ZVml4wIvHKEIMPE3JDJz0gYPbw_B84duXkUSYEurIX6z49SD3-4eoGQOyU30m9G_eDoTvTjlkpw3m1cJeF7oVFz7aFykTRhR1fv3GRspaKYCie4rlHL7JbClEoC04CZAh1hVFZ2meP78lZZxoSQlwPx-fI1FQfINgmtXrmygUci-qv_0WrttoC7KhhdyeRjO-vDquSGWKB_NBYKY3V1ptz5N39sWzIdqTm_EIXOvVEaXT4zLkyd_Eg5dGynITWORngyzWXJJwcuLMS-VtCX7dWncDD7RljAWECIM7AnnOjQKKalP4lchK2we_jAk56JaO387ktMVjcCfrYK2Gl-cx4AdlTGusVQgALLz4Jf87lwITFwDEVogClMoIColXspHhSLu9XWsw2doFsfNpTFIDc7821JY=w1164-h873-no?authuser=0")
# dave = User.create(name:'dave', username: 'dwisecar', bio: "hi, I'm dave.", city: 'Seattle, WA')
# adam = User.create(name:'adam')
# emiley = User.create(name:'emiley')
# ix = User.create(name:'ix')

animals.each do |animal|
    Species.create(name: animal)
end
# 10.times do
#     Species.create(name:Faker::Creature::Animal.name)
# end 

# 20.times do
#     Pet.create(name:Faker::Name.first_name, age: 4, user_id: User.all.sample.id, species_id: Species.all.sample.id)
# end 

# 5.times do
#     Post.create(title:Faker::Quote.singular_siegler, content:Faker::Quote.most_interesting_man_in_the_world, user_id: User.all.sample.id)
# end