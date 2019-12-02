class Customer < User
    validates :first_name, :last_name, presence: true
    validates :phone, allow_blank: true, length: { minimum: 8, maximum: 9}
end
