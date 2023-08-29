defmodule Phxball.Seeds do
  alias Phxball.Repo
  alias Phxball.Clubs.Club
  alias Phxball.People.Person
  alias Phxball.People.Player

  alias Phxball.Seeds.Teams

  def delete_all() do
    Repo.delete_all(Player)
    Repo.delete_all(Person)
    Repo.delete_all(Club)
  end

  def insert_all(), do: Teams.populate()
end

Phxball.Seeds.delete_all()
Phxball.Seeds.insert_all()
