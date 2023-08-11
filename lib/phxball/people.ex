defmodule Phxball.People do
  @moduledoc """
  The People context.
  """

  import Ecto.Query, warn: false
  alias Phxball.Repo

  alias Phxball.People.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end

  alias Phxball.People.Coach

  @doc """
  Returns the list of coaches.

  ## Examples

      iex> list_coaches()
      [%Coach{}, ...]

  """
  def list_coaches do
    Repo.all(Coach)
  end

  @doc """
  Gets a single coach.

  Raises `Ecto.NoResultsError` if the Coach does not exist.

  ## Examples

      iex> get_coach!(123)
      %Coach{}

      iex> get_coach!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coach!(id), do: Repo.get!(Coach, id)

  @doc """
  Creates a coach.

  ## Examples

      iex> create_coach(%{field: value})
      {:ok, %Coach{}}

      iex> create_coach(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coach(attrs \\ %{}) do
    %Coach{}
    |> Coach.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coach.

  ## Examples

      iex> update_coach(coach, %{field: new_value})
      {:ok, %Coach{}}

      iex> update_coach(coach, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coach(%Coach{} = coach, attrs) do
    coach
    |> Coach.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a coach.

  ## Examples

      iex> delete_coach(coach)
      {:ok, %Coach{}}

      iex> delete_coach(coach)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coach(%Coach{} = coach) do
    Repo.delete(coach)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coach changes.

  ## Examples

      iex> change_coach(coach)
      %Ecto.Changeset{data: %Coach{}}

  """
  def change_coach(%Coach{} = coach, attrs \\ %{}) do
    Coach.changeset(coach, attrs)
  end
end
