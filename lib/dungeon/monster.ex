defmodule Dungeon.Monster do
  use GenServer

  def init(args) do
    {:ok, args}
  end

  # Server 
  # Asynchronous
  def handle_cast({:attack, value}, life) do
    case life - value <= 0 do
      true -> Process.exit(self(), :dead_by_princess)
      false -> nil
    end

    {:noreply, life - value}
  end

  # Synchrone
  def handle_call({:life}, _caller, life) do
    {:reply, life, life}
  end

  # Client API
  def start_link(life) do
    {:ok, pid} = GenServer.start_link(__MODULE__, life)
    pid
  end

  def attacked(monster, value) do
    GenServer.cast(monster, {:attack, value})
  end

  def get_life(monster) do
    GenServer.call(monster, {:life})
  end
end
