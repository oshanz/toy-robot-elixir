defmodule App.Commands do
  alias App.Robot

  @type command :: list(String.t())
  @type state :: any() | nil
  @type reply :: String.t() | nil

  @spec execute(command(), state()) :: {:ok | :exit, state(), reply()}
  def execute(list, state) do
    run_command(list, state)
  end

  defp run_command(["PLACE", x, y, facing], position) do
    case Robot.place(String.to_integer(x), String.to_integer(y), facing) do
      {:error, reason} -> {:ok, position, reason}
      new_position -> {:ok, new_position, nil}
    end
  end

  defp run_command(["EXIT"], _position) do
    {:exit, nil, "👋"}
  end

  defp run_command(_, nil) do
    {:ok, nil, "Please place the robot first"}
  end

  defp run_command(["MOVE"], position) do
    state = Robot.move(position)
    {:ok, state, nil}
  end

  defp run_command(["LEFT"], position) do
    state = Robot.left(position)
    {:ok, state, nil}
  end

  defp run_command(["RIGHT"], position) do
    state = Robot.right(position)
    {:ok, state, nil}
  end

  defp run_command(["REPORT"], position) do
    message = Robot.report(position)
    {:ok, position, message}
  end

  defp run_command(_, position) do
    {:ok, position, "Invalid command"}
  end
end
