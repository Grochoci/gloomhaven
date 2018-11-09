class Scenario < ActiveRecord::Base
	has_many :scenario_monsters
	has_many :monsters, through: :scenario_monsters
end
