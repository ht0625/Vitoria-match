class CreateFeatureTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :feature_teams do |t|
      t.references :feature, foreign_key: true
      t.references :team, foreign_key: true
      t.timestamps
    end
  end
end
