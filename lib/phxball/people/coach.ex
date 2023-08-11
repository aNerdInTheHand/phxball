defmodule Phxball.People.Coach do
  use Ecto.Schema
  import Ecto.Changeset

  schema "coaches" do
    field :role, :string
    field :tactical, :integer
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(coach, attrs) do
    coach
    |> cast(attrs, [:role, :tactical])
    |> validate_required([:role, :tactical])
  end
end
