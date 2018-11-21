class AddInitiativeToAbility < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :initiative, :integer
  end
end
