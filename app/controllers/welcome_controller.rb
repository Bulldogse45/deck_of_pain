class WelcomeController < ApplicationController

  def index
    @decks = Deck.all
  end

end
