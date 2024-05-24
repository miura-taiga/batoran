class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :board_id, null: false
      t.text :body, null: false, limit: 65535

      t.timestamps
    end
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :comments, :boards, on_delete: :cascade
  end
end