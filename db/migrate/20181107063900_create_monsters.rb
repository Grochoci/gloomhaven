class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :portrait
      t.boolean :is_boss
      t.references :ability_deck, foreign_key: true
    end
  end
end
