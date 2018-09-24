class CreateSubTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_topics do |t|
      t.text :name
      t.text :description
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
