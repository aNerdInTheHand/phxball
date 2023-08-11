defmodule PhxballWeb.CoachLive.Show do
  use PhxballWeb, :live_view

  alias Phxball.People

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:coach, People.get_coach!(id))}
  end

  defp page_title(:show), do: "Show Coach"
  defp page_title(:edit), do: "Edit Coach"
end
