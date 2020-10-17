class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :label, null: false, default: ""
      t.timestamps
    end
  end
end
