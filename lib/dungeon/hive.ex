defmodule Dungeon.Hive do
  alias Dungeon.Monster

  use Supervisor

  def init(_) do
    children = [
      %{
        id: "Monster",
        start: {Monster, :start_link, 3}
      }
    ]

    Supervisor.start_link(children, :one_for_one, name: :hive)
  end
end
