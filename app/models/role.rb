class Role < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => :roles_users

    default_scope { order('name ASC') }
end
