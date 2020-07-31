class RecipesController < ApplicationController
    around_action :catch_not_found

    def index
        if params[:user_id]
            @user = User.find(params[:user_id])
            @recipes = @user.recipes
        else
            @recipes = Recipe.all
        end
    end

    def new
            @recipe = Recipe.new
            @recipe.ingredients.build
            @recipe.instructions.build
            @recipe.category_id = (params[:category_id]) if params[:category_id]
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        @recipe.user_id = current_user.id
        if @recipe.save 
            flash[:message] = "Sucessfully Created Recipe!"
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
        flash[:message] = "Your recipe was deleted"
        redirect_to user_path(current_user)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description, :user_id, :image, :category_id, ingredients_attributes: [:id, :name, :_destroy], instructions_attributes: [:id, :step, :_destroy])
    end

    def catch_not_found
        yield
    rescue ActiveRecord::RecordNotFound
        redirect_to root_url 
        flash[:error] = "Record not found." 
    end

end
