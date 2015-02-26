class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.references :question, index: true
      t.references :vote, index: true
      t.timestamps null: false
    end
  end
end
