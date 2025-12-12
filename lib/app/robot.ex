defmodule App.Robot do
  alias App.Robot.{Place, Move, Turn, Position}

  defdelegate place(x, y, facing), to: Place
  defdelegate move(position), to: Move
  defdelegate left(position), to: Turn
  defdelegate right(position), to: Turn

  @spec report(position :: Position.t()) :: String.t()
  def report(%Position{x: x, y: y, facing: facing}) do
    "#{x},#{y},#{facing}"
  end
end
