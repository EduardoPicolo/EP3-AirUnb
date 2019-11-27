class Host < User
    # has_one :user, as: :rolable, dependent: :destroy
    has_many :spots
end
