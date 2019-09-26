# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  u1 = User.create!(username: 'Markov')
  u2 = User.create!(username: 'Gizmo')

  a1 = Artwork.create!(title: 'Cats1', img_url: 'cats.url1', artist_id: 1)
  a2 = Artwork.create!(title: 'Cats2', img_url: 'cats.url2', artist_id: 2)
  a3 = Artwork.create!(title: 'Cats3', img_url: 'cats.url3', artist_id: 3)
  a4 = Artwork.create!(title: 'Cats4', img_url: 'cats.url4', artist_id: 4)

  # q1 = Question.create!(text: 'What Cat Is Cutest?', poll: p1)
  # ac1 = AnswerChoice.create!(text: 'Markov', question: q1)
  # ac2 = AnswerChoice.create!(text: 'Curie', question: q1)
  # ac3 = AnswerChoice.create!(text: 'Sally', question: q1)

  # q2 = Question.create!(text: 'Which Toy Is Most Fun?', poll: p1)
  # ac4 = AnswerChoice.create!(text: 'String', question: q2)
  # ac5 = AnswerChoice.create!(text: 'Ball', question: q2)
  # ac6 = AnswerChoice.create!(text: 'Bird', question: q2)

  # r1 = Response.create!(
  #   respondent: u2,
  #   answer_choice: ac3
  # )
  # r2 = Response.create!(
  #   respondent: u2,
  #   answer_choice: ac4
  # )
end