defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.deck)
    assert deck_length == 24
  end

  test "shuffle a deck randomizes the order" do
    deck = Cards.deck
    refute deck == Cards.shuffle(deck)
  end
end
