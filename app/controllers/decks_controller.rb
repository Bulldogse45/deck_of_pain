class DecksController < ApplicationController
  FACES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  def index
    @decks = Deck.all
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to @deck
    else
      render "new"
    end
  end

  def new
    @deck = Deck.new
  end

  def edit
    @deck = Deck.find(params[:id])
    render "new"
  end

  def show
    @deck = Deck.find(params['id'])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update(link_params)
      redirect_to @deck
    else
      render "new"
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to root_path
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :max_face)
  end
end
