class Spot < ApplicationRecord
    belongs_to :host
    has_many_attached :images

    acts_as_commontable dependent: :destroy

    validates :address, :price, :description, presence: true
end
