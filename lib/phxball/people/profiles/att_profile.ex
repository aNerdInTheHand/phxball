defmodule Phxball.People.Profiles.AttProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "att_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_aggress, :integer
    field :men_composure, :integer
    field :men_fortitude, :integer
    field :men_intelligence, :integer
    field :phys_speed, :integer
    field :phys_strength, :integer
    field :att_heading, :integer
    field :att_link_up, :integer
    field :att_shooting, :integer
    field :overall, :integer
  end
end
