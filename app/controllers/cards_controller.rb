class CardsController < ApplicationController

  def index
    @cards = Card.all
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card
    else
      render "new"
    end
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
    render "new"
  end

  def show
    @card = Card.find(params['id'])
    @card.update(turned:true)
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(link_params)
      redirect_to @card
    else
      render "new"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to root_path
  end

  private

  def card_params
    params.require(:card).permit()
  end

end
