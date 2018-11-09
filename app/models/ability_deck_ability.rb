class AbilityDeckAbility < ActiveRecord::Base
	belongs_to :ability_deck
	belongs_to :ability
end
