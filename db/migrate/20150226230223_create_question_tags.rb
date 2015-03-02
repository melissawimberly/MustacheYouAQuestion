class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question, index: true
      t.references :tag, index: true
      t.timestamps null: false
    end
  end
end
