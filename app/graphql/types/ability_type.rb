Types::AbilityType = GraphQL::ObjectType.define do
  name 'Ability'

  field :id, !types.ID
  field :reshuffle, !types.Boolean
  field :ability_image, !types.String
  field :initiative, !types.Int

end
