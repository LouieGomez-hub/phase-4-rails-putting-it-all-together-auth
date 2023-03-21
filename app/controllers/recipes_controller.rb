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

end
