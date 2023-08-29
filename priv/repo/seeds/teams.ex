defmodule Phxball.Seeds.Teams do
  alias Phxball.{
    ClubBuilder,
    PersonBuilder,
    PlayerBuilder
  }
  alias Phxball.People.Const
  alias Phxball.Teams.{
    Lfc,
    Nufc
  }

  def populate() do
    insert_free_agents_fc()
    insert_random_teams()
    Nufc.create()
    Lfc.create()
  end

  defp insert_free_agents_fc() do
    %{id: free_agents_fc_id} =
      ClubBuilder.build() |> ClubBuilder.with_name("Free Agents") |> ClubBuilder.insert()
    %{id: jeff_id} = PersonBuilder.build_for_club(free_agents_fc_id) |> PersonBuilder.insert()
    PlayerBuilder.build_for_person(jeff_id) |> PlayerBuilder.insert()
  end

  defp insert_random_teams() do
    %{id: random_team_1_id} = ClubBuilder.insert_random()
    %{id: random_team_2_id} = ClubBuilder.insert_random()

    for i <- 1..50 do
      club_id = if rem(i, 2) == 0, do: random_team_1_id, else: random_team_2_id
      %{id: person_id} = PersonBuilder.build_for_club(club_id) |> PersonBuilder.insert()

      position = case i do
        i when i < 6 -> Enum.random(filter_position_prefixes("gk_"))
        i when i < 18 -> Enum.random(filter_position_prefixes("def_"))
        i when i < 38 -> Enum.random(filter_position_prefixes("mid_"))
        _ -> Enum.random(filter_position_prefixes("att_"))
      end

      PlayerBuilder.build_for_person(person_id)
      |> PlayerBuilder.with_specific_position(position)
      |> PlayerBuilder.insert()
    end
  end

  defp filter_position_prefixes(position_prefix) do
    Const.positions()
    |> Enum.filter(fn x -> String.starts_with?(to_string(x), position_prefix) end)
  end
end
