class Host < User
    has_many :spots, dependent: :destroy

    validates :company_name, :company_address, :birthday, :cnpj, presence: true
    validates :phone, presence: true, length: { minimum: 8, maximum: 9}
    validates_length_of :cnpj, is: 14, message: "must be valid"
end
