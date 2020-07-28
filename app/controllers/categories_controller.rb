class CategoriesController < ApplicationController
    def index
     @breakfast_categories = Category.all.where(:name => 'breakfast')
     @lunch_categories = Category.all.where(:name => 'lunch')
     @dinner_categories = Category.all.where(:name => 'dinner')
     @dessert_categories = Category.all.where(:name => 'dessert')
     @snack_categories = Category.all.where(:name => 'snack')
     @beverage_categories = Category.all.where(:name => 'beverage')
    end

    def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes.order("created_at DESC")
    end
end
