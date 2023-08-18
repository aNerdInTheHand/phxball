defmodule PhxballWeb.ClubLiveTest do
  use PhxballWeb.ConnCase

  import Phoenix.LiveViewTest
  import Phxball.ClubsFixtures

  @create_attrs %{balance: 42, country: "some country", initials: "some initials", name: "some name", reputation: 42, short_name: "some short_name", stadium_id: 42}
  @update_attrs %{balance: 43, country: "some updated country", initials: "some updated initials", name: "some updated name", reputation: 43, short_name: "some updated short_name", stadium_id: 43}
  @invalid_attrs %{balance: nil, country: nil, initials: nil, name: nil, reputation: nil, short_name: nil, stadium_id: nil}

  defp create_club(_) do
    club = club_fixture()
    %{club: club}
  end

  describe "Index" do
    setup [:create_club]

    test "lists all clubs", %{conn: conn, club: club} do
      {:ok, _index_live, html} = live(conn, ~p"/clubs")

      assert html =~ "Listing Clubs"
      assert html =~ club.country
    end

    test "saves new club", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/clubs")

      assert index_live |> element("a", "New Club") |> render_click() =~
               "New Club"

      assert_patch(index_live, ~p"/clubs/new")

      assert index_live
             |> form("#club-form", club: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#club-form", club: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/clubs")

      html = render(index_live)
      assert html =~ "Club created successfully"
      assert html =~ "some country"
    end

    test "updates club in listing", %{conn: conn, club: club} do
      {:ok, index_live, _html} = live(conn, ~p"/clubs")

      assert index_live |> element("#clubs-#{club.id} a", "Edit") |> render_click() =~
               "Edit Club"

      assert_patch(index_live, ~p"/clubs/#{club}/edit")

      assert index_live
             |> form("#club-form", club: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#club-form", club: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/clubs")

      html = render(index_live)
      assert html =~ "Club updated successfully"
      assert html =~ "some updated country"
    end

    test "deletes club in listing", %{conn: conn, club: club} do
      {:ok, index_live, _html} = live(conn, ~p"/clubs")

      assert index_live |> element("#clubs-#{club.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#clubs-#{club.id}")
    end
  end

  describe "Show" do
    setup [:create_club]

    test "displays club", %{conn: conn, club: club} do
      {:ok, _show_live, html} = live(conn, ~p"/clubs/#{club}")

      assert html =~ "Show Club"
      assert html =~ club.country
    end

    test "updates club within modal", %{conn: conn, club: club} do
      {:ok, show_live, _html} = live(conn, ~p"/clubs/#{club}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Club"

      assert_patch(show_live, ~p"/clubs/#{club}/show/edit")

      assert show_live
             |> form("#club-form", club: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#club-form", club: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/clubs/#{club}")

      html = render(show_live)
      assert html =~ "Club updated successfully"
      assert html =~ "some updated country"
    end
  end
end
