class Host < User
    has_many :spots, dependent: :destroy

    validates :first_name, :last_name, :phone, :birthday, presence: true
end
