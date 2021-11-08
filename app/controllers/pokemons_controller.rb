class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    queryString = request.query_parameters
    if queryString.present?
      pageSize = queryString["pageSize"].to_i
      pageNumber = queryString["pageNumber"].to_i
      if pageSize.present? and pageNumber.present?   
        calcOffset = (pageNumber - 1)* pageSize
        @pokemons = Pokemon.all.offset(calcOffset).limit(pageSize)
      end
    else
      @pokemons = Pokemon.all
    end

    render json: @pokemons
  end

  # GET /pokemons/1
  def show
    render json: @pokemon
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created, location: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: @pokemon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pokemon_params
      params.require(:pokemon).permit(:id, :name, :type1, :type2, :total, :hp, :attack, :defense, :spattack, :spdefense, :speed, :generation, :legendary)
    end
end
