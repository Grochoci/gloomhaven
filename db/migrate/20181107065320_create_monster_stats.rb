class CreateMonsterStats < ActiveRecord::Migration[5.2]
  def change
    create_table :monster_stats do |t|
      t.references :monster, foreign_key: true
      t.integer :level
      t.boolean :is_elite
      t.integer :health
      t.integer :attack
      t.integer :movement
      t.integer :range
    end
  end
end
