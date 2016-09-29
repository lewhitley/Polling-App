class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results_nplusone
    answers = self.answer_choices
    result = {}
    answers.each do |answer|
      result[answer.text] = answer.responses.count
    end
    result
  end

  def results_okay
    answers = self.answer_choices.includes(:responses)
    result = {}
    answers.each do |answer|
      result[answer.text] = answer.responses.length
    end
    result
  end

  def results
    data = AnswerChoice.find_by_sql(["
      SELECT
        answer_choices.text, COUNT(responses.id) AS num_responses
      FROM
        questions
        JOIN
         answer_choices ON (questions.id = answer_choices.question_id)
        LEFT OUTER JOIN
         responses ON (responses.answer_choice_id = answer_choices.id)
      WHERE
        questions.id = ?
      GROUP BY
        answer_choices.id
    ", self.id])
    results = {}
    data.each do |result, count|
      results[count.text] = count.num_responses
    end
    results
  end
end
