class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.datetime :match_day, null: false, default: ""
      t.string :place, null: false, default: ""
      t.text :detail, null: false, default: ""
      t.boolean :status, null: false, default: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
