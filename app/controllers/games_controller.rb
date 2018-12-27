class Api::GamesController < ApplicationController  
    before_action :set_game, only: [:show, :edit, :destroy]

    def index 
        render json: Game.all
    end 

    def create
        game = Game.new(game_params)
            if game.save
                render json: game 
            else
                render json: {message: game.errors}, status: 400
            end 
    end

    def show 
        render json: @game 
    end 

    def update
        if @game.update(game_params)
            render json: @game
        else 
            render json: {message: @game.errors}, status: 400
        end 
    end 
    

    def destroy 
        if @game.destroy
            render status: 204
        else 
            render json: {message: "Unable to delete"}, status: 400
        end 
    end 

    private

    def set_game 
        @game = Game.find_by(id: params[:id])
    end 

    def game_params
        params.require(:game).permit(:name, :drinks, :directions, :image_url)
    end 
end