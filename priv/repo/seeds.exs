# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Phxball.Repo.insert!(%Phxball.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule Phxball.Seeds do

  alias Faker.Date
  alias Faker.Person, as: FakePerson

  alias Phxball.Repo
  alias Phxball.Clubs.Club
  alias Phxball.People.Person
  alias Phxball.People.Player

  def delete_all() do
    Repo.delete_all(Player)
    Repo.delete_all(Person)
    Repo.delete_all(Club)
  end

  def insert_all() do
    nufc = Repo.insert! %Club{
      name: "Newcastle United Football Club",
      short_name: "Newcastle",
      initials: "NUFC",
      country: "England",
      reputation: 94,
      balance: 100000000
    }

    bcfc = Repo.insert! %Club{
      name: "Bortchester City Football Club",
      short_name: "Bortchester",
      initials: "BCFC",
      country: "England",
      reputation: 100,
      balance: 75000000
    }

    for i <- 1..50 do
      if rem(i, 2) == 0 do
        person_id = insert_person(nufc.id)
      else
        person_id = insert_person(bcfc.id)
      end
    end
  end

  defp insert_person(club_id) do
    earliest_dob = ~D[1982-01-01]
    latest_dob = ~D[2007-01-01]
    min_wage = 1000
    max_wage = 150000

    Repo.insert!(%Person{
      dob: Date.between(earliest_dob, latest_dob),
      first_name: String.first(FakePerson.first_name()) <> ".",
      last_name: FakePerson.last_name(),
      gender: :male,
      role: :player,
      wage: Faker.random_between(min_wage, max_wage),
      reputation: Faker.random_between(0, 100),
      club_id: club_id
      },
    returning: [:id])
  end

  defp insert_player(person_id, club_id) do
    %Player{

    }
  end

end

Phxball.Seeds.delete_all()
Phxball.Seeds.insert_all()
