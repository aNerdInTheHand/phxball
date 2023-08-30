defmodule Phxball.People.Profiles.LwRwProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "lw_rw_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_intelligence, :integer
    field :phys_cardio, :integer
    field :phys_speed, :integer
    field :mid_flair, :integer
    field :mid_dribbling, :integer
    field :mid_passing, :integer
    field :overall, :integer
  end
end
