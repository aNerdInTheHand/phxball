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
    nick_pope(club_id)
  end

  defp nick_pope(club_id) do
    %{id: person_id} = %Person{
      first_name: "Nick",
      last_name: "Pope",
      dob: ~D[1992-04-19],
      gender: :male,
      reputation: 84,
      role: :player,
      wage: 100000,
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_world_class_gk_stats()
    |> PlayerBuilder.insert()
  end
end
