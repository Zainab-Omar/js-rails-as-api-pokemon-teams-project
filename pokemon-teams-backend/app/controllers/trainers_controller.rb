class TrainersController < ApplicationController
    def index
        trainers = Trainer.all
        render json: trainers.to_json(:include => {:pokemons => {only: [:id, :species, :nickname, :trainer_id]}}, :only => [:id, :name])
        # options = {
        #     include: [:pokemons]}
        # render json: TrainerSerializer.new(trainers, options)
    end

    def show
        trainer = Trainer.find(params[:id])
        render json: trainer, include: [:pokemons]
    end
end
