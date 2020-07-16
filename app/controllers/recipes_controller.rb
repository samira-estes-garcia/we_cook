class RecipesController < ApplicationController

    def new
        @recipe = current_user.recipes.build
    end

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :instructions, :category_id)
    end

end
