class AddTestToOption < ActiveRecord::Migration[7.0]
  def change
    add_reference :options, :test, null: false, foreign_key: true
  end
end
