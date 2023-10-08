defmodule MinhaApi.ItemAgent do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get_items do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def add_item(name, value) do
    Agent.update(__MODULE__, fn state -> Map.put(state, name, value) end)
  end

  def get_item(name) do
    Agent.get(__MODULE__, fn state -> Map.get(state, name) end)
  end

  def delete_item(name) do
    Agent.update(__MODULE__, fn state -> Map.delete(state, name) end)
  end
end
