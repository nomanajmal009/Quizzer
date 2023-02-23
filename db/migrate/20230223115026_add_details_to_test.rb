class AddDetailsToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :name, :string, null: false, default: ""
    add_column :tests, :description, :string
  end
end
