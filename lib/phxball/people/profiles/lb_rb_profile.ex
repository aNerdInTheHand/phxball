defmodule Phxball.People.Profiles.LbRbProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "lb_rb_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_intelligence, :integer
    field :phys_speed, :integer
    field :phys_cardio, :integer
    field :mid_passing, :integer
    field :def_positioning, :integer
    field :def_tackling, :integer
    field :def_attacking, :integer
    field :overall, :integer
  end
end
