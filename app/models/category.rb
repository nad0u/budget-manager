class Category < ActiveRecord::Base
    has_many :budgets, dependent: :destroy
end
