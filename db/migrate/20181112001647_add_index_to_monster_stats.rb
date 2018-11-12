class AddIndexToMonsterStats < ActiveRecord::Migration[5.2]
  def change
    add_index :monster_stats, :level
  end
end
