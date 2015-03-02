class Answer < ActiveRecord::Base

  has_many :comments
  has_many :answer_votes
  has_many :votes, through: :answer_votes
  belongs_to :user
  belongs_to :question

  def comments_desc
    comments.sort_by{|c| c.created_at}.reverse
  end
end
