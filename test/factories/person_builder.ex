defmodule Phxball.PersonBuilder do
  import Ecto.Query

  alias Phxball.Repo
  alias Phxball.People.Person
  alias Faker.Date
  alias Faker.Person, as: FakePerson

  def earliest_dob, do: ~D[1982-01-01]
  def latest_dob, do: ~D[2007-01-01]
  def min_wage, do: 1000
  def max_wage, do: 150000

  def build_for_club(club_id) do
    default_attrs()
    |> Map.put(:club_id, club_id)
  end

  def with_first_name(person, name) do
    Map.put(person, :first_name, name)
  end

  def with_last_name(person, name) do
    Map.put(person, :last_name, name)
  end

  def with_gender(person, gender) do
    Map.put(person, :gender, gender)
  end

  def with_role(person, role) do
    Map.put(person, :role, role)
  end

  def with_reputation(person, reputation) do
    Map.put(person, :reputation, reputation)
  end

  def with_dob(person, dob) do
    Map.put(person, :dob, dob)
  end

  def with_wage(person, wage) do
    Map.put(person, :wage, wage)
  end

  defp default_attrs do
    %Person{
      dob: Date.between(earliest_dob, latest_dob),
      first_name: String.first(FakePerson.first_name()) <> ".",
      last_name: FakePerson.last_name(),
      gender: :male,
      role: :player,
      wage: Faker.random_between(min_wage, max_wage),
      reputation: Faker.random_between(0, 100),
      club_id: 1
    }
  end

  def insert(person) do
    Repo.insert! person
  end
end
