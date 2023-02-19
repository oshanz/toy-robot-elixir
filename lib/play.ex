defmodule Play do
  def main(args) do
    args |> OptionParser.parse(switches: []) |> run()
  end

  defp run({[], _, []}) do
    start(nil)
  end

  defp start(position) do
    IO.gets("$") |> parse_command() |> run_command(position) |> start()
  end

  defp parse_command(command) do
    command
    |> String.upcase()
    |> String.trim()
    |> String.split([" ", ","], trim: true)
  end

  defp run_command(["PLACE", x, y, facing], position) do
    try do
      Robot.place(String.to_integer(x), String.to_integer(y), facing)
    rescue
      e -> IO.puts(e.message)
      position
    end
  end

  defp run_command(_, nil) do
    IO.puts("Please place the robot first")
    nil
  end

  defp run_command(["MOVE"], position) do
    Robot.move(position)
  end

  defp run_command(["LEFT"], position) do
    Robot.left(position)
  end

  defp run_command(["RIGHT"], position) do
    Robot.right(position)
  end

  defp run_command(["REPORT"], position) do
    Robot.report(position) |> IO.puts()
    position
  end

  defp run_command(_, position) do
    IO.puts("Invalid command")
    position
  end
end
