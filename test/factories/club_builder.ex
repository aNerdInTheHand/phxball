defmodule Phxball.ClubBuilder do
  import Ecto.Query

  alias Phxball.Repo
  alias Phxball.Clubs.Club
  alias Faker.Team.En

  def build do
    default_attrs()
  end

  def with_name(club, name) do
    Map.put(club, :name, name)
  end

  def with_initials(club, initials) do
    Map.put(club, :initials, initials)
  end

  def with_short_name(club, short_name) do
    Map.put(club, :short_name, short_name)
  end

  def with_reputation(club, reputation) do
    Map.put(club, :reputation, reputation)
  end

  defp default_attrs do
    %Club{
      balance: 1000000000,
      country: "England",
      initials: "XYZFC",
      name: En.name(),
      reputation: 99,
      short_name: "The Team"
    }
  end

  def insert_random, do: build() |> insert()

  def insert(club) do
    Repo.insert! club
  end
end
