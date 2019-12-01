class Host < User
    has_many :spots

    validates :first_name, :last_name, :phone, :birthday, presence: true
end
