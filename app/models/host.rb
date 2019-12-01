class Host < User
    has_many :spots, dependent: :destroy

    validates :company_name, :company_address, :birthday, :phone, :cnpj, presence: true
end
