defmodule PhxballWeb.CoachLive.FormComponent do
  use PhxballWeb, :live_component

  alias Phxball.People

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage coach records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="coach-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:role]} type="text" label="Role" />
        <.input field={@form[:tactical]} type="number" label="Tactical" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Coach</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{coach: coach} = assigns, socket) do
    changeset = People.change_coach(coach)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"coach" => coach_params}, socket) do
    changeset =
      socket.assigns.coach
      |> People.change_coach(coach_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"coach" => coach_params}, socket) do
    save_coach(socket, socket.assigns.action, coach_params)
  end

  defp save_coach(socket, :edit, coach_params) do
    case People.update_coach(socket.assigns.coach, coach_params) do
      {:ok, coach} ->
        notify_parent({:saved, coach})

        {:noreply,
         socket
         |> put_flash(:info, "Coach updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_coach(socket, :new, coach_params) do
    case People.create_coach(coach_params) do
      {:ok, coach} ->
        notify_parent({:saved, coach})

        {:noreply,
         socket
         |> put_flash(:info, "Coach created successfully")
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
