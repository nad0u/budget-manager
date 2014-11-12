class User < ActiveRecord::Base
    has_many :budgets, dependent: :destroy
end
