class AddColumnsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :pages, :integer
    add_column :books, :year, :integer
  end
end
