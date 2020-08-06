class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients, :dependent => :destroy
    has_many :instructions, :dependent => :destroy
    belongs_to :category

    accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :instructions, reject_if: :all_blank, allow_destroy: true

    has_attached_file :image, styles: { medium: "300x300#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    validates :title, :description, presence: true

    def self.ordered
        self.order('created_at desc')
    end

    def self.search(value)
        self.where("title LIKE ?", "%#{value}%" )
    end

    #move @recipes = Recipe.where("title LIKE ?", "%#{params[:title]}%" ) to scope method
end
