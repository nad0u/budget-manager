class Budget < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :name, :user_id, :amount, presence: true
end
