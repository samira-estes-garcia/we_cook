class RecipesController < ApplicationController

    def index
        @recipe = Recipe.all
    end

    def new
        @recipe = current_user.recipes.build
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def edit
        @recipe = Recipe.find(params[:id])
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
        params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :user_id)
    end

end
