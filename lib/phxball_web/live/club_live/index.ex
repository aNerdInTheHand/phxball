defmodule PhxballWeb.ClubLive.Index do
  use PhxballWeb, :live_view

  alias Phxball.Clubs
  alias Phxball.Clubs.Club

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :clubs, Clubs.list_clubs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Club")
    |> assign(:club, Clubs.get_club!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Club")
    |> assign(:club, %Club{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Clubs")
    |> assign(:club, nil)
  end

  @impl true
  def handle_info({PhxballWeb.ClubLive.FormComponent, {:saved, club}}, socket) do
    {:noreply, stream_insert(socket, :clubs, club)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    club = Clubs.get_club!(id)
    {:ok, _} = Clubs.delete_club(club)

    {:noreply, stream_delete(socket, :clubs, club)}
  end
end
