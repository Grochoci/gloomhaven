class GloomhavenSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
