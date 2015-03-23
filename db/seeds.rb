# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_1 = User.create(email: 'user_1@gmail.com', username:'user_1', password: "123")
user_2 = User.create(email: 'user_2@gmail.com', username:'user_2', password: "123")

question_1 = Question.create(user_id: 1, title: "fun in the sun?", description: "how do I have fun anymore?", view_count: 100)
question_2 = Question.create(user_id: 1, title: "pineapples?", description: "are they viable?", view_count: 88)
question_3 = Question.create(user_id: 1, title: "kiwi?", description: "are they viable or not???", view_count: 65)



answer_1 = Answer.create(description: 'yes they really are', user_id: 2, question_id: 2)
answer_2 = Answer.create(description: "you can't you're old!", user_id: 2, question_id: 1)

comment_1 = Comment.create(content: "ahhhhh noooo", user_id:2 , answer_id: 1)

pineapples = Tag.create(name: 'pineapples')

votes1 = Vote.create(vote_value: 1, user_id: 2)
question_vote2 = QuestionVote.create(question_id:1, vote_id:1)

t1 = Tag.create(name: "#beaches")
t2 = Tag.create(name: "#summer")

question_1.tags.push(t1)
question_1.tags.push(t2)

question_2.tags.push(pineapples)

answer_1.comments.push(comment_1)




