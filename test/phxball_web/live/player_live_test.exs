defmodule PhxballWeb.PlayerLiveTest do
  use PhxballWeb.ConnCase

  import Phoenix.LiveViewTest
  import Phxball.PeopleFixtures

  @create_attrs %{att_heading: 42, att_link_up: 42, att_shooting: 42, def_attacking: 42, def_heading: 42, def_marking: 42, def_positioning: 42, def_tackling: 42, gk_crosses: 42, gk_distribution: 42, gk_shotstopping: 42, men_aggression: 42, men_composure: 42, men_fortitude: 42, mid_dribbling: 42, mid_flair: 42, mid_passing: 42, mid_positioning: 42, mid_shooting: 42, phys_cardio: 42, phys_recovery: 42, phys_resilience: 42, phys_speed: 42, position: :goalkeeper}
  @update_attrs %{att_heading: 43, att_link_up: 43, att_shooting: 43, def_attacking: 43, def_heading: 43, def_marking: 43, def_positioning: 43, def_tackling: 43, gk_crosses: 43, gk_distribution: 43, gk_shotstopping: 43, men_aggression: 43, men_composure: 43, men_fortitude: 43, mid_dribbling: 43, mid_flair: 43, mid_passing: 43, mid_positioning: 43, mid_shooting: 43, phys_cardio: 43, phys_recovery: 43, phys_resilience: 43, phys_speed: 43, position: :defender}
  @invalid_attrs %{att_heading: nil, att_link_up: nil, att_shooting: nil, def_attacking: nil, def_heading: nil, def_marking: nil, def_positioning: nil, def_tackling: nil, gk_crosses: nil, gk_distribution: nil, gk_shotstopping: nil, men_aggression: nil, men_composure: nil, men_fortitude: nil, mid_dribbling: nil, mid_flair: nil, mid_passing: nil, mid_positioning: nil, mid_shooting: nil, phys_cardio: nil, phys_recovery: nil, phys_resilience: nil, phys_speed: nil, position: nil}

  defp create_player(_) do
    player = player_fixture()
    %{player: player}
  end

  describe "Index" do
    setup [:create_player]

    test "lists all players", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/players")

      assert html =~ "Listing Players"
    end

    test "saves new player", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/players")

      assert index_live |> element("a", "New Player") |> render_click() =~
               "New Player"

      assert_patch(index_live, ~p"/players/new")

      assert index_live
             |> form("#player-form", player: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player-form", player: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players")

      html = render(index_live)
      assert html =~ "Player created successfully"
    end

    test "updates player in listing", %{conn: conn, player: player} do
      {:ok, index_live, _html} = live(conn, ~p"/players")

      assert index_live |> element("#players-#{player.id} a", "Edit") |> render_click() =~
               "Edit Player"

      assert_patch(index_live, ~p"/players/#{player}/edit")

      assert index_live
             |> form("#player-form", player: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#player-form", player: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/players")

      html = render(index_live)
      assert html =~ "Player updated successfully"
    end

    test "deletes player in listing", %{conn: conn, player: player} do
      {:ok, index_live, _html} = live(conn, ~p"/players")

      assert index_live |> element("#players-#{player.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#players-#{player.id}")
    end
  end

  describe "Show" do
    setup [:create_player]

    test "displays player", %{conn: conn, player: player} do
      {:ok, _show_live, html} = live(conn, ~p"/players/#{player}")

      assert html =~ "Show Player"
    end

    test "updates player within modal", %{conn: conn, player: player} do
      {:ok, show_live, _html} = live(conn, ~p"/players/#{player}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Player"

      assert_patch(show_live, ~p"/players/#{player}/show/edit")

      assert show_live
             |> form("#player-form", player: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#player-form", player: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/players/#{player}")

      html = render(show_live)
      assert html =~ "Player updated successfully"
    end
  end
end
