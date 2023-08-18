defmodule PhxballWeb.ClubLive.FormComponent do
  use PhxballWeb, :live_component

  alias Phxball.Clubs

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage club records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="club-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:country]} type="text" label="Country" />
        <.input field={@form[:reputation]} type="number" label="Reputation" />
        <.input field={@form[:balance]} type="number" label="Balance" />
        <.input field={@form[:stadium_id]} type="number" label="Stadium" />
        <.input field={@form[:short_name]} type="text" label="Short name" />
        <.input field={@form[:initials]} type="text" label="Initials" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Club</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{club: club} = assigns, socket) do
    changeset = Clubs.change_club(club)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"club" => club_params}, socket) do
    changeset =
      socket.assigns.club
      |> Clubs.change_club(club_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"club" => club_params}, socket) do
    save_club(socket, socket.assigns.action, club_params)
  end

  defp save_club(socket, :edit, club_params) do
    case Clubs.update_club(socket.assigns.club, club_params) do
      {:ok, club} ->
        notify_parent({:saved, club})

        {:noreply,
         socket
         |> put_flash(:info, "Club updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_club(socket, :new, club_params) do
    case Clubs.create_club(club_params) do
      {:ok, club} ->
        notify_parent({:saved, club})

        {:noreply,
         socket
         |> put_flash(:info, "Club created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
