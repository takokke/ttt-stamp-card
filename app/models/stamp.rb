class Stamp < ApplicationRecord
    validates :event, presence: true
    belongs_to :user
end
