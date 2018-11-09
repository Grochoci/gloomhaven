class CreateAbilityDeckAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :ability_deck_abilities do |t|
      t.references :ability_deck, foreign_key: true
      t.references :ability, foreign_key: true
    end
  end
end
