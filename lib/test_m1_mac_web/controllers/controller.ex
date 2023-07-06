defmodule TestM1MacWeb.Controller do
  use TestM1MacWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
