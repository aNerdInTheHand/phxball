defmodule Phxball.People.SimplePlayer do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phxball.People.Const

  schema "simple_players" do
    field :overall, :integer
    field :position, Ecto.Enum, values: Const.positions()
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:position, :overall])
    |> validate_required([:position, :overall])
  end
end
