class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.references :answer, index: true
      t.references :vote, index: true
      t.timestamps null: false
    end
  end
end
