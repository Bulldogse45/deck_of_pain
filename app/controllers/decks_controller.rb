class DecksController < ApplicationController
  FACES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  SUITS = %w(Spades Hearts Diamonds Clubs)

  def index
    @decks = Deck.all
  end

  def create
    @deck = Deck.new(deck_params)
    new_cards_for_deck
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

  def reset
    @deck = Deck.find(params['id'])
    @deck.cards.each do |c|
      c.update(turned: false)
    end
    render "show"
  end

  def draw
    @deck = Deck.find(params['id'])
    cards = @deck.cards.where(turned:false)
    if cards.count > 0
      card = cards.shuffle.shift
      card.update(turned:true)
    end
    render "show"
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update(deck_params)
    @deck.cards = []
    new_cards_for_deck
    if @deck.save
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

  def new_cards_for_deck
    FACES.each do |f|
      break if f > @deck.max_face
      SUITS.each do |s|
        c = Card.new(suit:s, face:f)
        c.image_name = "#{f}_of_#{s}".downcase
        c.update(turned: false)
        @deck.cards << c
      end
    end
  end
end
