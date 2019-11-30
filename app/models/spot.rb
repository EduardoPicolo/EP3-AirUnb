class Spot < ApplicationRecord
    belongs_to :host
    has_one_attached :image

    acts_as_commontable
end
