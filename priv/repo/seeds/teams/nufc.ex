defmodule Phxball.Teams.Nufc do
  alias Phxball.{
    PersonBuilder,
    PlayerBuilder
  }
  alias Phxball.People.{
    Person,
    Player
  }
  alias Phxball.ClubBuilder, as: CB

  def create() do
    %{id: club_id} = create_club()
  end

  defp create_club() do
    %{id: club_id} = CB.build()
    |> CB.with_name("Newcastle United Football Club")
    |> CB.with_initials("NUFC")
    |> CB.with_short_name("Newcastle")
    |> CB.with_reputation(90)
    |> CB.insert()

    create_players(club_id)
  end

  defp create_players(club_id) do
    goalkeepers(club_id)
  end

  defp goalkeepers(club_id) do
    nick_pope(club_id)
    martin_dubravka(club_id)
    loris_karius(club_id)
    mark_gillespie(club_id)
  end

  defp nick_pope(club_id) do
    %{id: person_id} = %Person{
      first_name: "Nick",
      last_name: "Pope",
      dob: ~D[1992-04-19],
      gender: :male,
      reputation: 89,
      role: :player,
      wage: 100000,
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_world_class_gk_stats()
    |> PlayerBuilder.insert()
  end

  defp martin_dubravka(club_id) do
    %{id: person_id} = %Person{
      first_name: "Martin",
      last_name: "Dubravka",
      dob: ~D[1989-01-15],
      gender: :male,
      reputation: 84,
      role: :player,
      wage: 44000,
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:excellent, "gk")
    |> PlayerBuilder.insert()
  end

  defp loris_karius(club_id) do
    %{id: person_id} = %Person{
      first_name: "Loris",
      last_name: "Karius",
      dob: ~D[1993-06-22],
      gender: :male,
      reputation: 74,
      role: :player,
      wage: 30000,
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:good, "gk")
    |> PlayerBuilder.insert()
  end

  defp mark_gillespie(club_id) do
    %{id: person_id} = %Person{
      first_name: "Mark",
      last_name: "Gillespie",
      dob: ~D[1992-03-27],
      gender: :male,
      reputation: 50,
      role: :player,
      wage: 5900,
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:decent, "gk")
    |> PlayerBuilder.insert()
  end
end
