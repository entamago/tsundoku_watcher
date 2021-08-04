class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,          null: false
      t.text       :article,        null: false
      t.text       :reference_info
      t.references :genre,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
