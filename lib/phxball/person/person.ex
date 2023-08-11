defmodule Phxball.Person.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :dob, :date
    field :first_name, :string
    field :gender, Ecto.Enum, values: [:male, :female, :other]
    field :last_name, :string
    field :reputation, :integer
    field :role, Ecto.Enum, values: [:player, :coach, :administrator]
    field :wage, :integer

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :dob, :gender, :role, :wage, :reputation])
    |> validate_required([:first_name, :last_name, :dob, :gender, :role, :wage, :reputation])
  end
end
