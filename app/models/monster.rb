class Monster < ActiveRecord::Base
	belongs_to :ability_deck
	has_many :abilities, -> { order initiative: :asc }, through: :ability_deck
	has_many :scenario_monsters
	has_many :scenarios, through: :scenario_monsters
	has_many :monster_stats
end
