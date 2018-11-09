class CreateAbilityDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :ability_decks do |t|
      t.string :name, index: true
      t.string :back_image
    end
  end
end
