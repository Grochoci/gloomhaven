Types::MonsterType = GraphQL::ObjectType.define do
  name 'Monster'

  field :id, !types.ID
  field :name, !types.String
  field :is_boss, !types.Boolean
  field :portrait, !types.String
  field :ability_deck, -> { Types::AbilityDeckType }

end
