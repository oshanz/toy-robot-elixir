defmodule Play do
  alias App.Commands

  def main(args) do
    args |> OptionParser.parse(switches: []) |> run()
  end

  defp run({[], _, []}) do
    loop({:ok, nil})
  end

  defp loop({:ok, state}) do
    IO.gets("$") |> parse_command() |> Commands.execute(state) |> say() |> loop()
  end

  defp loop({:exit, _}) do
  end

  defp parse_command(command) do
    command
    |> String.upcase()
    |> String.trim()
    |> String.split([" ", ","], trim: true)
  end

  defp say({term, state, message}) when is_binary(message) do
    IO.puts(message)
    {term, state}
  end

  defp say({term, state, nil}), do: {term, state}
end
