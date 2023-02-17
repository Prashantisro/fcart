class Product < ApplicationRecord
    has_one_attached :photo
    belongs_to :user, optional: true
    # belongs_to :categories
    has_many :line_items, dependent: :destroy
    # enum :category, [:toys, :electronics, :food]


    # validates :description, length: { minimum: 2, message: "Description must be min.2 letter"}
end

