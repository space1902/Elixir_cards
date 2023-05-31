defmodule Cards do

  @moduledoc """
  This module contains functions for creating and manipulating decks of cards.
  """
  @doc """
  Returns a list of strings representing a deck of cards.

  ##Examples

    iex> deck = Cards.deck
    iex> {hand, deck} = Cards.deal(deck, 1)
    iex> hand
    ["clubs of ace"]
  """

  def deck do
    values =["ace", "two", "three", "four", "five", "six"]
     suits = ["clubs", "diamonds", "hearts", "spades"]

     for suit <- suits, value <- values do
      "#{suit} of #{value}"
     end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns true if the deck contains the given card, false otherwise.
  
  ##Examples
  
    iex> deck = Cards.deck
    iex> Cards.contains?(deck, "clubs of ace")
    true
    iex> Cards.contains?(deck, "clubs of king")
    false
  """
  
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a tuple of two lists representing a hand of cards and the remaining deck.
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck of cards to a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Loads a deck of cards from a file.
  """
  def load(filename) do
    case File.read(filename)do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "file_not_found"
    end
  end

  @doc """
  Returns a list of strings representing a hand of cards.
  """
  def create_hand(hand_size) do
    Cards.deck
    |> Cards.shuffle
    |> Cards.deal( hand_size)
  end
end
