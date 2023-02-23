class Source < ApplicationRecord
    has_one_attached :csv

    has_many :expenses
end
