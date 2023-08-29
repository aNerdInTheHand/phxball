defmodule Phxball.PlayerBuilder do
  import Ecto.Query

  alias Phxball.Repo
  alias Phxball.People.{
    Const,
    Player
  }

  def build_for_person(person_id) do
    default_attrs()
    |> Map.put(:person_id, person_id)
  end

  defp default_attrs do
    %Player{
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
      men_intelligence: Faker.random_between(1, 100),
      mid_dribbling: Faker.random_between(1, 100),
      mid_flair: Faker.random_between(1, 100),
      mid_passing: Faker.random_between(1, 100),
      mid_positioning: Faker.random_between(1, 100),
      mid_shooting: Faker.random_between(1, 100),
      phys_cardio: Faker.random_between(1, 100),
      phys_recovery: Faker.random_between(1, 100),
      phys_resilience: Faker.random_between(1, 100),
      phys_speed: Faker.random_between(1, 100),
      position: Enum.random Const.positions()
    }
  end

  def insert(person) do
    Repo.insert! person
  end
end
