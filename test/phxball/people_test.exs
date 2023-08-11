defmodule Phxball.PeopleTest do
  use Phxball.DataCase

  alias Phxball.People

  describe "players" do
    alias Phxball.People.Player

    import Phxball.PeopleFixtures

    @invalid_attrs %{att_heading: nil, att_link_up: nil, att_shooting: nil, def_attacking: nil, def_heading: nil, def_marking: nil, def_positioning: nil, def_tackling: nil, gk_crosses: nil, gk_distribution: nil, gk_shotstopping: nil, men_aggression: nil, men_composure: nil, men_fortitude: nil, mid_dribbling: nil, mid_flair: nil, mid_passing: nil, mid_positioning: nil, mid_shooting: nil, phys_cardio: nil, phys_recovery: nil, phys_resilience: nil, phys_speed: nil, position: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert People.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert People.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{att_heading: 42, att_link_up: 42, att_shooting: 42, def_attacking: 42, def_heading: 42, def_marking: 42, def_positioning: 42, def_tackling: 42, gk_crosses: 42, gk_distribution: 42, gk_shotstopping: 42, men_aggression: 42, men_composure: 42, men_fortitude: 42, mid_dribbling: 42, mid_flair: 42, mid_passing: 42, mid_positioning: 42, mid_shooting: 42, phys_cardio: 42, phys_recovery: 42, phys_resilience: 42, phys_speed: 42, position: :goalkeeper}

      assert {:ok, %Player{} = player} = People.create_player(valid_attrs)
      assert player.att_heading == 42
      assert player.att_link_up == 42
      assert player.att_shooting == 42
      assert player.def_attacking == 42
      assert player.def_heading == 42
      assert player.def_marking == 42
      assert player.def_positioning == 42
      assert player.def_tackling == 42
      assert player.gk_crosses == 42
      assert player.gk_distribution == 42
      assert player.gk_shotstopping == 42
      assert player.men_aggression == 42
      assert player.men_composure == 42
      assert player.men_fortitude == 42
      assert player.mid_dribbling == 42
      assert player.mid_flair == 42
      assert player.mid_passing == 42
      assert player.mid_positioning == 42
      assert player.mid_shooting == 42
      assert player.phys_cardio == 42
      assert player.phys_recovery == 42
      assert player.phys_resilience == 42
      assert player.phys_speed == 42
      assert player.position == :goalkeeper
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{att_heading: 43, att_link_up: 43, att_shooting: 43, def_attacking: 43, def_heading: 43, def_marking: 43, def_positioning: 43, def_tackling: 43, gk_crosses: 43, gk_distribution: 43, gk_shotstopping: 43, men_aggression: 43, men_composure: 43, men_fortitude: 43, mid_dribbling: 43, mid_flair: 43, mid_passing: 43, mid_positioning: 43, mid_shooting: 43, phys_cardio: 43, phys_recovery: 43, phys_resilience: 43, phys_speed: 43, position: :defender}

      assert {:ok, %Player{} = player} = People.update_player(player, update_attrs)
      assert player.att_heading == 43
      assert player.att_link_up == 43
      assert player.att_shooting == 43
      assert player.def_attacking == 43
      assert player.def_heading == 43
      assert player.def_marking == 43
      assert player.def_positioning == 43
      assert player.def_tackling == 43
      assert player.gk_crosses == 43
      assert player.gk_distribution == 43
      assert player.gk_shotstopping == 43
      assert player.men_aggression == 43
      assert player.men_composure == 43
      assert player.men_fortitude == 43
      assert player.mid_dribbling == 43
      assert player.mid_flair == 43
      assert player.mid_passing == 43
      assert player.mid_positioning == 43
      assert player.mid_shooting == 43
      assert player.phys_cardio == 43
      assert player.phys_recovery == 43
      assert player.phys_resilience == 43
      assert player.phys_speed == 43
      assert player.position == :defender
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_player(player, @invalid_attrs)
      assert player == People.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = People.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> People.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = People.change_player(player)
    end
  end

  describe "coaches" do
    alias Phxball.People.Coach

    import Phxball.PeopleFixtures

    @invalid_attrs %{role: nil, tactical: nil}

    test "list_coaches/0 returns all coaches" do
      coach = coach_fixture()
      assert People.list_coaches() == [coach]
    end

    test "get_coach!/1 returns the coach with given id" do
      coach = coach_fixture()
      assert People.get_coach!(coach.id) == coach
    end

    test "create_coach/1 with valid data creates a coach" do
      valid_attrs = %{role: "some role", tactical: 42}

      assert {:ok, %Coach{} = coach} = People.create_coach(valid_attrs)
      assert coach.role == "some role"
      assert coach.tactical == 42
    end

    test "create_coach/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = People.create_coach(@invalid_attrs)
    end

    test "update_coach/2 with valid data updates the coach" do
      coach = coach_fixture()
      update_attrs = %{role: "some updated role", tactical: 43}

      assert {:ok, %Coach{} = coach} = People.update_coach(coach, update_attrs)
      assert coach.role == "some updated role"
      assert coach.tactical == 43
    end

    test "update_coach/2 with invalid data returns error changeset" do
      coach = coach_fixture()
      assert {:error, %Ecto.Changeset{}} = People.update_coach(coach, @invalid_attrs)
      assert coach == People.get_coach!(coach.id)
    end

    test "delete_coach/1 deletes the coach" do
      coach = coach_fixture()
      assert {:ok, %Coach{}} = People.delete_coach(coach)
      assert_raise Ecto.NoResultsError, fn -> People.get_coach!(coach.id) end
    end

    test "change_coach/1 returns a coach changeset" do
      coach = coach_fixture()
      assert %Ecto.Changeset{} = People.change_coach(coach)
    end
  end
end
