class AbilityDeck < ActiveRecord::Base
	has_many :ability_deck_abilities
	has_many :abilities, through: :ability_deck_abilities
end
