class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
    	t.integer :number, index: true
    	t.string :name
    end
  end
end
