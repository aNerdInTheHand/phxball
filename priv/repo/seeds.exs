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
      position = case i do
        i when i < 6 -> :goalkeeper

        i when i < 18 -> :defender

        i when i < 38 -> :midfielder

        _ -> :attacker
      end

      IO.inspect(position, label: "POSITION")

      if rem(i, 2) == 0 do
        person = insert_person(nufc.id)
        insert_player(person.id, position)
      else
        person = insert_person(bcfc.id)
        insert_player(person.id, position)
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

  defp insert_player(person_id, position) do
    positions = [:goalkeeper, :defender, :midfielder, :attacker]
    Repo.insert! %Player{
      att_heading: Faker.random_between(1, 100),
      att_link_up: Faker.random_between(1, 100),
      att_shooting: Faker.random_between(1, 100),
      def_attacking: Faker.random_between(1, 100),
      def_heading: Faker.random_between(1, 100),
      def_marking: Faker.random_between(1, 100),
      def_positioning: Faker.random_between(1, 100),
      def_tackling: Faker.random_between(1, 100),
      gk_crosses: Faker.random_between(1, 100),
      gk_distribution: Faker.random_between(1, 100),
      gk_shotstopping: Faker.random_between(1, 100),
      men_aggression: Faker.random_between(1, 100),
      men_composure: Faker.random_between(1, 100),
      men_fortitude: Faker.random_between(1, 100),
      mid_dribbling: Faker.random_between(1, 100),
      mid_flair: Faker.random_between(1, 100),
      mid_passing: Faker.random_between(1, 100),
      mid_positioning: Faker.random_between(1, 100),
      mid_shooting: Faker.random_between(1, 100),
      phys_cardio: Faker.random_between(1, 100),
      phys_recovery: Faker.random_between(1, 100),
      phys_resilience: Faker.random_between(1, 100),
      phys_speed: Faker.random_between(1, 100),
      position: position,
      person_id: person_id
    }
  end

end

Phxball.Seeds.delete_all()
Phxball.Seeds.insert_all()
