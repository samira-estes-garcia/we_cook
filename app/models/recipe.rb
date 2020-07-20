class Recipe < ApplicationRecord
    belongs_to :users

    #accepts_nested_attributes_for :ingredients, 
                                    # reject_if: proc { |attributes| attributes['name'].blank? }, 
                                    # allow_destroy: true

    #validates :title, :description, :instructions, :image, presence: true
    #has_attached_file :image, styles: {medium => "400x400" }
    #validates_attachment_content_type :image, content_type: /\image\/.*\Z/
end
