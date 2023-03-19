class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.text :description, null: false
      t.boolean :is_true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
