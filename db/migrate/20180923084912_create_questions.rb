class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
      t.string :content
      t.string :qns_type, default: 'Objective'
      t.string :difficulty, default: 'Medium'
      t.string :content
      t.string :solution
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4

      t.references :subject, foreign_key: true
      t.references :chapter, foreign_key: true
      t.references :topic, foreign_key: true
      t.references :sub_topic, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
