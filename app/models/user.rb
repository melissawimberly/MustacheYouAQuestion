class User < ActiveRecord::Base
  has_secure_password

  has_many :answers
  has_many :questions
  has_many :comments
  has_many :answer_votes
  has_many :votes, through: :answer_votes
  has_many :question_votes
  has_many :votes, through: :question_votes
end
