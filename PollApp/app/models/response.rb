class Response < ActiveRecord::Base
  validates :responder_id, :answer_choice_id, presence: true

  validate :not_duplicate_response, :not_respond_to_own_poll

  def not_duplicate_response
    if respondent_already_answered?
      errors[:you] << "already responded"
    end
  end

  def not_respond_to_own_poll
    if own_poll?
      errors[:you] << "created this poll"
    end
  end

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :responder_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.where(:responder_id => self.responder_id).exists?
  end

  def own_poll?
    self.question.poll.author_id == self.responder_id
  end
end
