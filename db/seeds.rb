# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tests_arr=[]

=begin
puts "users"
users_arr=[]
(1..1000).each do |u|
  user = User.new(
      :email                 => "nikolaygrebnev@yandex.ru",
      :password              => "password#{u}",
      :password_confirmation => "password#{u}",
      :first_name            => "Name #{u}",
      :last_name             => "Lant name #{u}"
  )
  user.skip_confirmation!
  user.type = "Admin" if u == 1
  user.save!
  users_arr << user
end
=end

user = User.new(
    :email                 => "nikolaygrebnev@yandex.ru",
    :password              => "password123",
    :password_confirmation => "password123",
    :first_name            => "Name admin",
    :last_name             => "Last name"
)
user.skip_confirmation!
user.type = "Admin"
user.save!

user = User.new(
    :email                 => "nikolaygrebnev@gmail.com",
    :password              => "password123",
    :password_confirmation => "password123",
    :first_name            => "Nik",
    :last_name             => "Grebnev"
)
user.skip_confirmation!
user.save!


(1..10).each do |i|
  puts "category #{i}"
  category = Category.create(title: "Category #{i}")
  (1..2).each do |t|
    author = 1 #users_arr[rand(users_arr.count)].id
    test = category.tests.create(title: "Test #{t} / #{i}", level: rand(2), author_id: author)
    tests_arr << test
    (1..3).each do |q|
      question = test.questions.create(body: "Question #{i} / #{t} / #{q} " + Digest::SHA2.hexdigest("#{i}#{t}#{q}"))
      (1..4).each do |a|
        answer = question.answers.create(body: "Answer #{a} / #{i} / #{t} / #{q}", correct: rand(2))
      end
    end
  end
end

badges = [
['Знак 1','http://falerist.org/cache/com_zoo/images/Morskoy_opolchencheskiy_znak_NikolayI_a17b70659821656e5007fc8a4739376f.jpg',1,0],
['Знак 2','http://falerist.org/cache/com_zoo/images/Znak%20Moskovskij%20rkheologicheskij%20institut_993478a6ebe1d90ea2b3d7dcc5075b95.jpg',2,0],
['Знак 3','http://falerist.org/cache/com_zoo/images/Znak%20Magistra%20Rossijskoj%20imperii_eba011e37b3c7288c528607a0094dbd5.jpg',2,1],
['Знак 4','http://falerist.org/cache/com_zoo/images/Za_otlichnuyu_sluzhbu_v_MVD_tip2_avers_e0dda830accfe1f71bb6b10be70de94c.png',2,2],
['Знак 5','http://falerist.org/cache/com_zoo/images/Zasluzhennyy_rabotnik_NKVD_tip2_avers_4f609d9b7ae421f760790fb86ed3b06a.png',3,1],
['Знак 6','http://falerist.org/cache/com_zoo/images/Pamyatnyy_zheton_NKVD_Severnoy_oblasti_RSFSR_v_chest_1-y_godovshchiny_Oktyabrya_tip2_avers_01e2222d9a136a17bcfbd9c52aefc702.png',3,2],
['Знак 7','http://falerist.org/cache/com_zoo/images/Sluzhebnyy_znak_sotrudnika_Moskovskogo_Ugolovnogo_rozyska_avers_0d08d312a8da373b52d09b2b2815aa3f.png',3,3],
['Знак 8','http://falerist.org/cache/com_zoo/images/Narukavnyy_znak_sotrudnika_militsii_tip1_avers_6183583b597bdbd944d697566676ae42.png',3,4],
['Знак 9','http://falerist.org/cache/com_zoo/images/Yedinyy_znak_na_golovnoy_ubor_dlya_sotrudnikov_vnutrennikh_del_tip3_avers_9dd79446a4ded2e22b8e427d082be808.png',3,5],
['Знак 10','https://upload.wikimedia.org/wikipedia/commons/6/69/Badge_Off-High-School_SU.png',3,6]
].map do |title, url, badge_rule, badge_type|
  { title: title, url: url, badge_rule: badge_rule, badge_type: badge_type}
end
Badge.create(badges)


#puts "passes"
#users_arr.each do |u|
#  (1..100).each do |p|
#    pass = Pass.create(user_id: u.id, test_id: tests_arr[rand(tests_arr.count)].id, result: rand(100))
#  end
#end

#    test = Test.create(title: "Test #{t}/#{i}", level: rand(10), category_id: category.id, author_id: users_arr[rand(users_arr.count)].id)
#      question = Question.create(body: "Question #{i}/#{t}/#{q}" + Digest::SHA2.hexdigest("#{i}#{t}#{q}"), test_id: test.id)
#        answer = Answer.create(body: "Answer #{a}/#{i}/#{t}/#{q}", correct: rand(2), question_id: question.id)
