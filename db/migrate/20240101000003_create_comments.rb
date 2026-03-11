class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :post,        null: false, foreign_key: true
      t.text       :body,        null: false
      t.string     :author_name, null: false
      t.timestamps
    end
  end
end
