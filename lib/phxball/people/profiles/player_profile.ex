defmodule Phxball.People.Profiles.PlayerProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "player_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :att_heading, :integer
    field :att_link_up, :integer
    field :att_shooting, :integer
    field :def_attacking, :integer
    field :def_heading, :integer
    field :def_marking, :integer
    field :def_positioning, :integer
    field :def_tackling, :integer
    field :gk_crosses, :integer
    field :gk_distribution, :integer
    field :gk_shotstopping, :integer
    field :men_aggression, :integer
    field :men_composure, :integer
    field :men_fortitude, :integer
    field :men_intelligence, :integer
    field :mid_dribbling, :integer
    field :mid_flair, :integer
    field :mid_passing, :integer
    field :mid_positioning, :integer
    field :mid_shooting, :integer
    field :phys_cardio, :integer
    field :phys_recovery, :integer
    field :phys_resilience, :integer
    field :phys_speed, :integer
    field :phys_strength, :integer
    field :position, Ecto.Enum, values: Const.positions()
  end
end
