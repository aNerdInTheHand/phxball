defmodule Phxball.People.Profiles.GkProfile do
  use Ecto.Schema
  alias Phxball.People.Const

  @primary_key false
  schema "gk_profiles" do
    field :first_name
    field :last_name
    field :person_id, :id
    field :player_id, :id
    field :club_id, :id
    field :position, Ecto.Enum, values: Const.positions()
    field :men_composure, :integer
    field :men_fortitude, :integer
    field :gk_crosses, :integer
    field :gk_distribution, :integer
    field :gk_shotstopping, :integer
    field :overall, :integer
  end
end
