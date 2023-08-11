defmodule Phxball.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Phxball.People` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        att_heading: 42,
        att_link_up: 42,
        att_shooting: 42,
        def_attacking: 42,
        def_heading: 42,
        def_marking: 42,
        def_positioning: 42,
        def_tackling: 42,
        gk_crosses: 42,
        gk_distribution: 42,
        gk_shotstopping: 42,
        men_aggression: 42,
        men_composure: 42,
        men_fortitude: 42,
        mid_dribbling: 42,
        mid_flair: 42,
        mid_passing: 42,
        mid_positioning: 42,
        mid_shooting: 42,
        phys_cardio: 42,
        phys_recovery: 42,
        phys_resilience: 42,
        phys_speed: 42,
        position: :goalkeeper
      })
      |> Phxball.People.create_player()

    player
  end

  @doc """
  Generate a coach.
  """
  def coach_fixture(attrs \\ %{}) do
    {:ok, coach} =
      attrs
      |> Enum.into(%{
        role: "some role",
        tactical: 42
      })
      |> Phxball.People.create_coach()

    coach
  end
end
