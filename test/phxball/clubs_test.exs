defmodule Phxball.ClubsTest do
  use Phxball.DataCase

  alias Phxball.Clubs

  describe "clubs" do
    alias Phxball.Clubs.Club

    import Phxball.ClubsFixtures

    @invalid_attrs %{balance: nil, country: nil, initials: nil, name: nil, reputation: nil, short_name: nil, stadium_id: nil}

    test "list_clubs/0 returns all clubs" do
      club = club_fixture()
      assert Clubs.list_clubs() == [club]
    end

    test "get_club!/1 returns the club with given id" do
      club = club_fixture()
      assert Clubs.get_club!(club.id) == club
    end

    test "create_club/1 with valid data creates a club" do
      valid_attrs = %{balance: 42, country: "some country", initials: "some initials", name: "some name", reputation: 42, short_name: "some short_name", stadium_id: 42}

      assert {:ok, %Club{} = club} = Clubs.create_club(valid_attrs)
      assert club.balance == 42
      assert club.country == "some country"
      assert club.initials == "some initials"
      assert club.name == "some name"
      assert club.reputation == 42
      assert club.short_name == "some short_name"
      assert club.stadium_id == 42
    end

    test "create_club/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Clubs.create_club(@invalid_attrs)
    end

    test "update_club/2 with valid data updates the club" do
      club = club_fixture()
      update_attrs = %{balance: 43, country: "some updated country", initials: "some updated initials", name: "some updated name", reputation: 43, short_name: "some updated short_name", stadium_id: 43}

      assert {:ok, %Club{} = club} = Clubs.update_club(club, update_attrs)
      assert club.balance == 43
      assert club.country == "some updated country"
      assert club.initials == "some updated initials"
      assert club.name == "some updated name"
      assert club.reputation == 43
      assert club.short_name == "some updated short_name"
      assert club.stadium_id == 43
    end

    test "update_club/2 with invalid data returns error changeset" do
      club = club_fixture()
      assert {:error, %Ecto.Changeset{}} = Clubs.update_club(club, @invalid_attrs)
      assert club == Clubs.get_club!(club.id)
    end

    test "delete_club/1 deletes the club" do
      club = club_fixture()
      assert {:ok, %Club{}} = Clubs.delete_club(club)
      assert_raise Ecto.NoResultsError, fn -> Clubs.get_club!(club.id) end
    end

    test "change_club/1 returns a club changeset" do
      club = club_fixture()
      assert %Ecto.Changeset{} = Clubs.change_club(club)
    end
  end
end
