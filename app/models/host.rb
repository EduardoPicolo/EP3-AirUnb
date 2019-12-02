class Host < User
    has_many :spots, dependent: :destroy

    validates :company_name, :company_address, :birthday, :phone, :cnpj, presence: true
    validates_length_of :cnpj, is: 14, message: "must be valid"
end
