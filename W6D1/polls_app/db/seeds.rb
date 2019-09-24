# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  user1 = User.create!(username: 'Lisa')
  user2 = User.create!(username: 'Wolf')
  user3 = User.create!(username: 'MeanDean')
  user4 = User.create!(username: 'Carlos')
  user5 = User.create!(username: 'Ryan')

  Poll.destroy_all
  poll1 = Poll.create!(user_id: 1,title: "Wolf") 
  poll2 = Poll.create!(user_id: 2,title: "Dean") 
  
  Question.destroy_all
  question1 = Question.create!(poll_id: 1, body: "How old is Wolf?")
  question2 = Question.create!(poll_id: 1, body: "How may questions poll has?")
  question3 = Question.create!(poll_id: 2, body: "How mean is Dean?")
  question4 = Question.create!(poll_id: 2, body: "How lean is Dean?")
  question5 = Question.create!(poll_id: 2, body: "What is the story behind MeanDean?")

  AnswerChoice.destroy_all
  achoice1 = AnswerChoice.create!(question_id: 1, body: "Its a Secreet! =)")
  achoice2 = AnswerChoice.create!(question_id: 2, body: "I don't know.")
  achoice3 = AnswerChoice.create!(question_id: 3, body: "Guess...")
  achoice4 = AnswerChoice.create!(question_id: 2, body: "Ask MeanDean.")
  achoice5 = AnswerChoice.create!(question_id: 1, body: "All the above.")
  
  Response.destroy_all
  response1 = Response.create!(user_id: 1, answer_choice_id: 1)
  response2 = Response.create!(user_id: 2, answer_choice_id: 1)
  response3 = Response.create!(user_id: 3, answer_choice_id: 2)
  response4 = Response.create!(user_id: 4, answer_choice_id: 5)
  response5 = Response.create!(user_id: 5, answer_choice_id: 3)
end