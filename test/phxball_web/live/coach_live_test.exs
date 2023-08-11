defmodule PhxballWeb.CoachLiveTest do
  use PhxballWeb.ConnCase

  import Phoenix.LiveViewTest
  import Phxball.PeopleFixtures

  @create_attrs %{role: "some role", tactical: 42}
  @update_attrs %{role: "some updated role", tactical: 43}
  @invalid_attrs %{role: nil, tactical: nil}

  defp create_coach(_) do
    coach = coach_fixture()
    %{coach: coach}
  end

  describe "Index" do
    setup [:create_coach]

    test "lists all coaches", %{conn: conn, coach: coach} do
      {:ok, _index_live, html} = live(conn, ~p"/coaches")

      assert html =~ "Listing Coaches"
      assert html =~ coach.role
    end

    test "saves new coach", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/coaches")

      assert index_live |> element("a", "New Coach") |> render_click() =~
               "New Coach"

      assert_patch(index_live, ~p"/coaches/new")

      assert index_live
             |> form("#coach-form", coach: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#coach-form", coach: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/coaches")

      html = render(index_live)
      assert html =~ "Coach created successfully"
      assert html =~ "some role"
    end

    test "updates coach in listing", %{conn: conn, coach: coach} do
      {:ok, index_live, _html} = live(conn, ~p"/coaches")

      assert index_live |> element("#coaches-#{coach.id} a", "Edit") |> render_click() =~
               "Edit Coach"

      assert_patch(index_live, ~p"/coaches/#{coach}/edit")

      assert index_live
             |> form("#coach-form", coach: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#coach-form", coach: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/coaches")

      html = render(index_live)
      assert html =~ "Coach updated successfully"
      assert html =~ "some updated role"
    end

    test "deletes coach in listing", %{conn: conn, coach: coach} do
      {:ok, index_live, _html} = live(conn, ~p"/coaches")

      assert index_live |> element("#coaches-#{coach.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#coaches-#{coach.id}")
    end
  end

  describe "Show" do
    setup [:create_coach]

    test "displays coach", %{conn: conn, coach: coach} do
      {:ok, _show_live, html} = live(conn, ~p"/coaches/#{coach}")

      assert html =~ "Show Coach"
      assert html =~ coach.role
    end

    test "updates coach within modal", %{conn: conn, coach: coach} do
      {:ok, show_live, _html} = live(conn, ~p"/coaches/#{coach}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Coach"

      assert_patch(show_live, ~p"/coaches/#{coach}/show/edit")

      assert show_live
             |> form("#coach-form", coach: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#coach-form", coach: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/coaches/#{coach}")

      html = render(show_live)
      assert html =~ "Coach updated successfully"
      assert html =~ "some updated role"
    end
  end
end
