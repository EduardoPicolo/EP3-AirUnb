class Host < ApplicationRecord
    has_one :user, as: :rolable, dependent: :destroy
end
