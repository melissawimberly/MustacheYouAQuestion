class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description, null: false
      t.references :user, index: true
      t.references :question, index: true
      t.timestamps null: false
    end
  end
end
