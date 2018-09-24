class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
      t.string :name
      t.string :type
      t.string :difficulty, default: 'Medium'
      t.string :content
      t.string :solution

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
