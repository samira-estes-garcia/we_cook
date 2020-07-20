class RecipesController < ApplicationController

    def index
        @recipes = current_user.recipes
    end

    def new
        @recipe = current_user.recipes.build
    end

    def show
        #@recipe = Recipe.find(params[:id]).where(:user_id => current_user.id)
        @recipe = current_user.recipe
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)

        if @recipe.save 
            # redirect_to user_recipe_path(current_user.recipe)
            redirect_to @recipe
        else
            render 'new'
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :category_id)
    end



    # before_action { @user = User.find(params[:user_id]) }

    # def index
    #     if params[:user_id]
    #         @recipe = User.find(params[:user_id]).recipes
    #       else
    #         @recipe = Recipe.all
    #       end
    # end

    # def new
    #     @recipe = @user.recipes.build
    # end

    # def create
    #     @recipe = @user.recipes.build(recipe_params)
    #     if @recipe.save
    #         redirect_to user_recipe_path(@user.recipe)
    #     else
    #         render 'new'
    #     end
    # end

    # def show
    #     @recipe = Recipe.find(params[:id])
    # end

    # def edit
    #     @recipe = Recipe.find(params[:id])
    # end

    # private

    # def recipe_params
    #     params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :category_id)
    # end

end
