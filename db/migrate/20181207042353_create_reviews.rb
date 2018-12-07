class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.text :body
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
