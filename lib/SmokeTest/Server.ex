defmodule SmokeTest.Server do
  use GenServer

  @impl GenServer
  def init(_init_arg) do
    Process.flag(:trap_exit, true)
    {:ok, nil}
  end

  # def handle_cast({:start}, state) do

  # end

  @impl GenServer
  def handle_info(:kill, state) do
    {:stop, :normal, state}
  end

  # Public Interface

  def start() do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def stop() do
    send(__MODULE__, :kill)
  end
end
