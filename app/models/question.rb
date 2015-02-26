class Question < ActiveRecord::Base

  belongs_to :user
  has_many :question_votes
  has_many :votes, through: :question_votes
  has_many :question_tags
  has_many :tags through: :question_tags
end
