class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.boolean :reshuffle
      t.string :ability_image
    end
  end
end
