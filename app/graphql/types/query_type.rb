module Types
  class QueryType < Types::BaseObject

    field :all_monsters, [MonsterType], null: false,
      description: "Get all monsters"

    def all_monsters
      Monster.all
    end
  end
end
