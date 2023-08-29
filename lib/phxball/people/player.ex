defmodule Phxball.People.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Phxball.People.Const

  schema "players" do
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
    field :position, Ecto.Enum, values: Const.positions()
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:position, :men_aggression, :men_composure, :men_fortitude, :phys_cardio, :phys_speed, :phys_recovery, :phys_resilience, :gk_shotstopping, :gk_crosses, :gk_distribution, :def_marking, :def_positioning, :def_heading, :def_tackling, :def_attacking, :mid_positioning, :mid_passing, :mid_shooting, :mid_dribbling, :mid_flair, :att_shooting, :att_heading, :att_link_up])
    |> validate_required([:position, :men_aggression, :men_composure, :men_fortitude, :phys_cardio, :phys_speed, :phys_recovery, :phys_resilience, :gk_shotstopping, :gk_crosses, :gk_distribution, :def_marking, :def_positioning, :def_heading, :def_tackling, :def_attacking, :mid_positioning, :mid_passing, :mid_shooting, :mid_dribbling, :mid_flair, :att_shooting, :att_heading, :att_link_up])
  end
end
