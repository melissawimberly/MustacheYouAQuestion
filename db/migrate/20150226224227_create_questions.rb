class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :view_count
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
