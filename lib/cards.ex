defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Simultaneous comprehensions
    for suit <- suits, value <- values do
        # Joining strings
        # value <> " of " <> suit
        # String interpolation
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # Returns a {tuple} of {[hand_size], [remainder]}
    Enum.split(deck, hand_size)
  end

  # Save to the filesystem
  def save(deck, filename) do
    # need to call erlang
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # Load from filesystem
  def load(filename) do
    # {status, binary} = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist"
    # end

    # Refactored
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end

  end
end
