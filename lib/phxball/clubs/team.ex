defmodule Phxball.Clubs.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :team_gender, Ecto.Enum, values: [:mens, :womens]
    field :team_type, Ecto.Enum, values: [:senior, :reserve, :u23, :u21, :u19, :u18, :u17, :u16, :u14, :u11]
    field :club_id, :id

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:team_gender, :team_type])
    |> validate_required([:team_gender, :team_type])
  end
end
