class User < ActiveRecord::Base
  has_secure_password

  has_many :answers
  has_many :questions
  has_many :comments
  has_many :answer_votes
  has_many :votes, through: :answer_votes
  has_many :question_votes
  has_many :votes, through: :question_votes


  def reputation
		vote_tally = []

  	self.answers.each do |answer|
  		answer.answer_votes.each do |answer_vote|
  			vote_tally << answer_vote.vote.vote_value
  		end
  	end

  	self.questions.each do |question|
  		question.question_votes.each do |question_vote|
  			vote_tally << question_vote.vote.vote_value
  		end
  	end

  	vote_tally.inject(:+) || 0
  end
end
