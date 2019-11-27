class Spot < ApplicationRecord
    belongs_to :host
    has_one_attached :image
end
