class CreateScenarioMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :scenario_monsters do |t|
      t.references :scenario, foreign_key: true
      t.references :monster, foreign_key: true
    end
  end
end
