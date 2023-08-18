defmodule Phxball.ClubsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Phxball.Clubs` context.
  """

  @doc """
  Generate a club.
  """
  def club_fixture(attrs \\ %{}) do
    {:ok, club} =
      attrs
      |> Enum.into(%{
        balance: 42,
        country: "some country",
        name: "some name",
        reputation: 42,
        stadium_id: 42
      })
      |> Phxball.Clubs.create_club()

    club
  end

  @doc """
  Generate a club.
  """
  def club_fixture(attrs \\ %{}) do
    {:ok, club} =
      attrs
      |> Enum.into(%{
        balance: 42,
        country: "some country",
        initials: "some initials",
        name: "some name",
        reputation: 42,
        short_name: "some short_name",
        stadium_id: 42
      })
      |> Phxball.Clubs.create_club()

    club
  end
end
