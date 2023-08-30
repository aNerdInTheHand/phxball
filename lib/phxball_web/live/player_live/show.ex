defmodule PhxballWeb.PlayerLive.Show do
  use PhxballWeb, :live_view

  alias Phxball.People
  alias Phxball.People.Profiles

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:player, Profiles.get_cm_profile(id))}
  end

  defp page_title(:show), do: "Show Player"
  defp page_title(:edit), do: "Edit Player"
end
