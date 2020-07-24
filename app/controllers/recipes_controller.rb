class RecipesController < ApplicationController

    def index
        if params[:user_id]
            @recipes = User.find(params[:user_id]).recipes
        else
            @recipes = Recipe.all.order('created_at DESC')
        end
        # @recipe = Recipe.all.order('created_at DESC')
    end

    def new
        @recipe = current_user.recipes.build
        @recipe.ingredients.build
        @recipe.instructions.build
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)

        if @recipe.save 
            redirect_to @recipe
        else
            render 'new'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render 'edit'
        end
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
        redirect_to user_path(current_user)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :user_id, :image, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy])
    end

end
