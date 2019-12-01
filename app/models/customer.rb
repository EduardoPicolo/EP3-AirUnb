class Customer < User
    validates :first_name, :last_name, presence: true
end
