class RecipesController < ApplicationController

    def index
        recipe = Recipe.all
        if user.valid?
            session[:user_id] = user.id
            render json: recipe, status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
        end
    end

    def create
        recipe = Recipe.create(recipe_params)
        if recipe.valid?
            session[:recipe_id] = recipe.id
            render json: recipe, status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :recipe_id
        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
end