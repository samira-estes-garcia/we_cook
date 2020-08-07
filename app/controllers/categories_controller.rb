class CategoriesController < ApplicationController

    def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes.order("created_at DESC")
    @recipe = @category.recipes
    end

end
