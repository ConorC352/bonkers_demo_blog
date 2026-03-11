class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :name,  null: false
      t.string :email, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
