Types::AbilityDeckType = GraphQL::ObjectType.define do
  name 'AbilityDeck'

  field :id, !types.ID
  field :name, !types.String
  field :back_image, !types.String

end
