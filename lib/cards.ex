defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # List comprehensions
    # Each element => do block => loaded into new list
    # This returns a nested list - needs to be passed to List.flatten
    cards = for suit <- suits do
      for value <- values do
        # Joining strings
        # value <> " of " <> suit
        # String interpolation
        "#{value} of #{suit}"
      end
    end

    List.flatten(cards)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
