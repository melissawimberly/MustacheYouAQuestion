class AnswerVote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :vote
end
