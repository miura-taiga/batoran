class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :store_name
      t.string :product_name
      t.string :jan_code
      t.date :expiration_date

      t.timestamps
    end
  end
end
