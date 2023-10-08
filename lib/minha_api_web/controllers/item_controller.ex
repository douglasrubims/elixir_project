defmodule MinhaApiWeb.ItemController do
  use MinhaApiWeb, :controller

  alias MinhaApi.ItemAgent

  def index(conn, _params) do
    items = ItemAgent.get_items()
    json(conn, items)
  end

  def create(conn, %{"item" => item_params}) do
    :ok = ItemAgent.add_item(item_params["name"], item_params["value"])
    json(conn, item_params)
  end

  def show(conn, %{"id" => id}) do
    item = ItemAgent.get_item(id)
    json(conn, item)
  end

  def delete(conn, %{"id" => id}) do
    :ok = ItemAgent.delete_item(id)
    send_resp(conn, :no_content, "")
  end
end
