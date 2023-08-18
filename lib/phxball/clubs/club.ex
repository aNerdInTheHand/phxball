defmodule Phxball.Clubs.Club do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clubs" do
    field :balance, :integer
    field :country, :string
    field :initials, :string
    field :name, :string
    field :reputation, :integer
    field :short_name, :string
    field :stadium_id, :integer

    timestamps()
  end

  @doc false
  def changeset(club, attrs) do
    club
    |> cast(attrs, [:name, :country, :reputation, :balance, :stadium_id, :short_name, :initials])
    |> validate_required([:name, :country, :reputation, :balance, :stadium_id, :short_name, :initials])
  end
end
