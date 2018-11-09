class Ability < ActiveRecord::Base
	has_many :ability_deck_abilities
	has_many :ability_decks, through: :ability_deck_abilities
end
