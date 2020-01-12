defmodule Dungeon.Princess do
  alias Dungeon.Monster

  def hi() do
    IO.puts("World!")
  end

  # Server
  def start do
    spawn(fn -> start_killing_machine() end)
  end

  def start_killing_machine() do
    receive do
      {:attack, monster} ->
        Monster.attacked(monster, 2)
        # code
    end

    start_killing_machine()
  end

  # API
  def attack(princess, monster) do
    send(princess, {:attack, monster})
  end
end
