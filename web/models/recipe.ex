defmodule Munchcal.Recipe do
  use Ecto.Model

  @derive {Poison.Encoder, only: [
    :_id, :name
  ]}
  schema "recipes" do
    field :name

    timestamps
  end
end

