defmodule Munchcal.RecipeView do
  use Munchcal.Web, :view

  def render("index.json", %{recipes: recipes}) do
    recipes
  end
end

