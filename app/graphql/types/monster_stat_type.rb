Types::MonsterStatType = GraphQL::ObjectType.define do
  name 'MonsterStat'

  field :id, !types.ID
  field :level, !types.Int
  field :is_elite, !types.Boolean
  field :health, !types.Int
  field :attack, types.Int
  field :movement, types.Int
  field :range, types.Int

end
