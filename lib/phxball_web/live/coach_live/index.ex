defmodule PhxballWeb.CoachLive.Index do
  use PhxballWeb, :live_view

  alias Phxball.People
  alias Phxball.People.Coach

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :coaches, People.list_coaches())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Coach")
    |> assign(:coach, People.get_coach!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Coach")
    |> assign(:coach, %Coach{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Coaches")
    |> assign(:coach, nil)
  end

  @impl true
  def handle_info({PhxballWeb.CoachLive.FormComponent, {:saved, coach}}, socket) do
    {:noreply, stream_insert(socket, :coaches, coach)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    coach = People.get_coach!(id)
    {:ok, _} = People.delete_coach(coach)

    {:noreply, stream_delete(socket, :coaches, coach)}
  end
end
