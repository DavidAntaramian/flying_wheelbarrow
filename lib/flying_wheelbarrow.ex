defmodule FlyingWheelbarrow do
  @moduledoc """
  Documentation for FlyingWheelbarrow.
  """

  use GenServer

  def init(name) do
    send(self(), :hello_and_repeat)
    {:ok, name}
  end

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def handle_info(:hello_and_repeat, name) do
    Process.send_after(self(), :hello_and_repeat, 1000)
    IO.puts("Hello, #{name}, from #{inspect(self())}")
    {:noreply, name}
  end
end
