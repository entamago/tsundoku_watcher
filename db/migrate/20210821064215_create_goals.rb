class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string     :short_tern_goal,   null: false
      t.string     :routine
      t.date       :time_limit,        null: false
      t.boolean    :achievement,       null: false, default: false
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
