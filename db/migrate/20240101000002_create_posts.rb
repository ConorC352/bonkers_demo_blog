class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string     :title,        null: false
      t.string     :slug,         null: false, index: { unique: true }
      t.text       :excerpt,      null: false
      t.text       :content,      null: false
      t.boolean    :published,    default: false, null: false
      t.datetime   :published_at
      t.references :author,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
