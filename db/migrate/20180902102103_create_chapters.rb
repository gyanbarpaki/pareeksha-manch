class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.text :title
      t.text :description
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
