defmodule Phxball.People.Profiles do
  @moduledoc """
  The Player Profiles context.
  """

  import Ecto.Query, warn: false
  alias Phxball.Repo

  alias Phxball.People.Profiles.PlayerProfile
  alias Phxball.People.Profiles.CmProfile

  @doc """
  Returns the profile for the player

  Raises `Ecto.NoResultsError` if the profile does not exist.

  ## Examples

      iex> get_profile!(1)
      %PlayerProfile

      iex> get_profile!(1000)
      ** (Ecto.NoResultsError)
  """
  def get_profile(player_id) do
    from(pp in PlayerProfile,
      where: pp.player_id == ^player_id,
      select: pp
    )
    |> Repo.one()
    |> Map.put(:id, player_id)
  end

  def get_cm_profile(player_id) do
    from(pp in CmProfile,
      where: pp.player_id == ^player_id,
      select: pp
    )
    |> Repo.one()
    |> Map.put(:id, player_id)
  end

  def get_profiles_for_club(club_id) do
    from(pp in PlayerProfile,
      where: pp.club_id == ^club_id,
      select: pp
    )
    |> Repo.all()
  end
end
