defmodule TestM1MacWeb.ErrorJSONTest do
  use TestM1MacWeb.ConnCase, async: true

  test "renders 404" do
    assert TestM1MacWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert TestM1MacWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
