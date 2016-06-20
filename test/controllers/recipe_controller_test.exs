defmodule Munchcal.RecipeControllerTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias Munchcal.Recipe
  alias Munchcal.Repo

  test "/ returns a list of recipes" do
    recipes_as_json =
      %Recipe{name: "Spaghetti Carbonara"}
      |> Repo.insert!
      |> List.wrap
      |> Poison.encode!

    response = conn(:get, "/api/recipes") |> send_request

    assert response.status == 200
    assert response.resp_body == recipes_as_json
  end

  defp send_request(conn) do
    conn
    |> put_private(:plug_skip_csrf_protection, true)
    |> Munchcal.Endpoint.call([])
  end
end

