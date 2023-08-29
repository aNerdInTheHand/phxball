defmodule Phxball.Teams.Nufc do
  alias Phxball.{
    PersonBuilder,
    PlayerBuilder
  }
  alias Phxball.ClubBuilder, as: CB

  def create() do
    create_club()
  end

  defp create_club() do
    CB.build()
    |> CB.with_name("Newcastle United Football Club")
    |> CB.with_initials("NUFC")
    |> CB.with_short_name("Newcastle")
    |> CB.with_reputation(90)
    |> CB.insert()
  end

  # defp create_players() do

  # end

  # defp nick_pope, do: %{
  #   first_name: "Nick",
  #   last_name: "Pope",

  # }
end
