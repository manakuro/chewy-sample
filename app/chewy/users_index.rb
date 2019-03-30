class UsersIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      email: {
        tokenizer: 'keyword',
        filter: ['lowercase']
      }
    }
  }

  define_type User.confirmed do
    field :name
    field :email, analyzer: 'email'
    field :phone
  end
end
