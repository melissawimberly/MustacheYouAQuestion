class Question < ActiveRecord::Base

  belongs_to :user
  has_many :question_votes
  has_many :votes, through: :question_votes
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers

  class << self

    def get_trending(limit)
       questions = Question.order('view_count DESC').limit(limit)
    end

    def get_most_voted_on(limit)
      counts = QuestionVote.group(:question_id).order('count_all DESC').limit(limit).count
      questions = Question.find(counts.keys)
    end
  end
end
