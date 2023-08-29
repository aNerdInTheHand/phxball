defmodule Phxball.Teams.Lfc do
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
    |> CB.with_name("Liverpool Football Club")
    |> CB.with_initials("LFC")
    |> CB.with_short_name("Liverpool")
    |> CB.with_reputation(97)
    |> CB.insert()
  end
end
