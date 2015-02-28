class QuestionVote < ActiveRecord::Base
  belongs_to :question
  belongs_to :vote

  # validate :check_for_others

  # def check_for_others
  # 	existing = QuestionVote.where(question_id: question_id, user_id: user_id).count
  # 	if existing  > 1
  # 		errors.add()
  # 	end 

  # end
end
