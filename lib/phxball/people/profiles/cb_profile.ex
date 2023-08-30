defmodule Phxball.People.Profiles.CbProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "cb_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_aggresion, :integer
    field :men_composure, :integer
    field :phys_speed, :integer
    field :phys_strength, :integer
    field :def_heading, :integer
    field :def_marking, :integer
    field :def_positioning, :integer
    field :def_tackling, :integer
    field :overall, :integer
  end
end
