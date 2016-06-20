defmodule Munchcal.RecipeController do
  use Munchcal.Web, :controller
  alias Munchcal.Repo
  alias Munchcal.Recipe

  def index(conn, _params) do
    recipes = Repo.all(Recipe)
    render conn, recipes: recipes
  end
end

