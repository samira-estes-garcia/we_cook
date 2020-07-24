class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    has_many :instructions

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :instructions, reject_if: :all_blank, allow_destroy: true

    has_attached_file :image, styles: { medium: "300x300#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :title, :description, presence: true
end
