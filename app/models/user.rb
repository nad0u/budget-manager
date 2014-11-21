class User < ActiveRecord::Base
    has_many :budgets, dependent: :destroy
    validates :passw, confirmation: true
    validates :email, :uname, :passw_confirmation, presence: true
    validates :is_admin, inclusion: {in: [true, false]}
end
