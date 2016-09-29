# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

billy_the_goat = User.create!(user_name: "Billy Goat")
joey_the_goat = User.create!(user_name: "Joey Goat")
nanny_the_goat = User.create!(user_name: "Nanny Goat")
kit_the_goat = User.create!(user_name: "Kit Goat")

people = Poll.create!(title: "A person", author_id: billy_the_goat.id)
favorite_color = Poll.create!(title: "Colors!", author_id: kit_the_goat.id)
favorite_food = Poll.create!(title: "Foods", author_id: nanny_the_goat.id)

first_question = Question.create!(text: "Who?", poll_id: people.id)
second_question = Question.create!(text: "light or dark?", poll_id: favorite_color.id)
third_question = Question.create!(text: "Which color?", poll_id: favorite_color.id)
fourth_question = Question.create!(text: "Favorite shade of fur?", poll_id: favorite_color.id)
fifth_question = Question.create!(text: "Pick a food!!!", poll_id: favorite_food.id)

choice_one = AnswerChoice.create!(text: "Billy", question_id: first_question.id)
choice_two = AnswerChoice.create!(text: "Joey", question_id: first_question.id)
choice_three = AnswerChoice.create!(text: "Nanny", question_id: first_question.id)
choice_four = AnswerChoice.create!(text: "Kit", question_id: first_question.id)

light = AnswerChoice.create!(text: "Light.", question_id: second_question.id)
dark = AnswerChoice.create!(text: "Dark.", question_id: second_question.id)

red = AnswerChoice.create!(text: "Red", question_id: third_question.id)
blue = AnswerChoice.create!(text: "Blue", question_id: third_question.id)
yellow = AnswerChoice.create!(text: "Yellow", question_id: third_question.id)
purple = AnswerChoice.create!(text: "Purple", question_id: third_question.id)

white = AnswerChoice.create!(text: "White", question_id: fourth_question.id)
beige = AnswerChoice.create!(text: "Beige", question_id: fourth_question.id)
black = AnswerChoice.create!(text: "Black", question_id: fourth_question.id)
burgundy = AnswerChoice.create!(text: "Burgundy", question_id: fourth_question.id)

grass = AnswerChoice.create!(text: "Grass", question_id: fifth_question.id)
crackers = AnswerChoice.create!(text: "Crackers", question_id: fifth_question.id)
wheat = AnswerChoice.create!(text: "Wheat", question_id: fifth_question.id)

Response.create!(responder_id: joey_the_goat.id, answer_choice_id: choice_four.id)
Response.create!(responder_id: nanny_the_goat.id, answer_choice_id: choice_two.id)
Response.create!(responder_id: kit_the_goat.id, answer_choice_id: choice_one.id)

Response.create!(responder_id: joey_the_goat.id, answer_choice_id: light.id)
Response.create!(responder_id: billy_the_goat.id, answer_choice_id: dark.id)

Response.create!(responder_id: billy_the_goat.id, answer_choice_id: red.id)
Response.create!(responder_id: joey_the_goat.id, answer_choice_id: blue.id)
Response.create!(responder_id: nanny_the_goat.id, answer_choice_id: purple.id)

Response.create!(responder_id: billy_the_goat.id, answer_choice_id: burgundy.id)
Response.create!(responder_id: nanny_the_goat.id, answer_choice_id: beige.id)

Response.create!(responder_id: joey_the_goat.id, answer_choice_id: grass.id)
Response.create!(responder_id: kit_the_goat.id, answer_choice_id: wheat.id)
Response.create!(responder_id: billy_the_goat.id, answer_choice_id: crackers.id)
