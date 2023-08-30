defmodule Phxball.People.Profiles.CmProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "cm_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_aggression, :integer
    field :men_composure, :integer
    field :men_fortitude, :integer
    field :men_intelligence, :integer
    field :phys_cardio, :integer
    field :phys_strength, :integer
    field :mid_flair, :integer
    field :mid_passing, :integer
    field :mid_positioning, :integer
    field :mid_shooting, :integer
    field :overall, :integer
  end
end
