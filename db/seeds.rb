# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tests_arr=[]
users_arr=[]

puts "users"
(1..1000).each do |u|
  users_arr << User.create(login: "user#{u}", password: Digest::SHA1.hexdigest("password#{u}"))
end

(1..10).each do |i|
  puts "category #{i}"
  category = Category.create(title: "Category #{i}")
  (1..100).each do |t|
    test = category.tests.create(title: "Test #{t}/#{i}", level: rand(10), author_id: users_arr[rand(users_arr.count)].id)
    tests_arr << test
    (1..20).each do |q|
      question = test.questions.create(body: "Question #{i}/#{t}/#{q}" + Digest::SHA2.hexdigest("#{i}#{t}#{q}"))
      (1..4).each do |a|
        answer = question.answers.create(body: "Answer #{a}/#{i}/#{t}/#{q}", correct: rand(2))
      end
    end
  end
end

puts "passes"
users_arr.each do |u|
  (1..100).each do |p|
    pass = Pass.create(user_id: u.id, test_id: tests_arr[rand(tests_arr.count)].id, result: rand(100))
  end
end

#    test = Test.create(title: "Test #{t}/#{i}", level: rand(10), category_id: category.id, author_id: users_arr[rand(users_arr.count)].id)
#      question = Question.create(body: "Question #{i}/#{t}/#{q}" + Digest::SHA2.hexdigest("#{i}#{t}#{q}"), test_id: test.id)
#        answer = Answer.create(body: "Answer #{a}/#{i}/#{t}/#{q}", correct: rand(2), question_id: question.id)
