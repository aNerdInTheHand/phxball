defmodule PhxballWeb.PlayerLive.FormComponent do
  use PhxballWeb, :live_component

  alias Phxball.People

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage player records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="player-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:position]}
          type="select"
          label="Position"
          prompt="Choose a value"
          options={Ecto.Enum.values(Phxball.People.Player, :position)}
        />
        <.input field={@form[:men_aggression]} type="number" label="Men aggression" />
        <.input field={@form[:men_composure]} type="number" label="Men composure" />
        <.input field={@form[:men_fortitude]} type="number" label="Men fortitude" />
        <.input field={@form[:phys_cardio]} type="number" label="Phys cardio" />
        <.input field={@form[:phys_speed]} type="number" label="Phys speed" />
        <.input field={@form[:phys_recovery]} type="number" label="Phys recovery" />
        <.input field={@form[:phys_resilience]} type="number" label="Phys resilience" />
        <.input field={@form[:gk_shotstopping]} type="number" label="Gk shotstopping" />
        <.input field={@form[:gk_crosses]} type="number" label="Gk crosses" />
        <.input field={@form[:gk_distribution]} type="number" label="Gk distribution" />
        <.input field={@form[:def_marking]} type="number" label="Def marking" />
        <.input field={@form[:def_positioning]} type="number" label="Def positioning" />
        <.input field={@form[:def_heading]} type="number" label="Def heading" />
        <.input field={@form[:def_tackling]} type="number" label="Def tackling" />
        <.input field={@form[:def_attacking]} type="number" label="Def attacking" />
        <.input field={@form[:mid_positioning]} type="number" label="Mid positioning" />
        <.input field={@form[:mid_passing]} type="number" label="Mid passing" />
        <.input field={@form[:mid_shooting]} type="number" label="Mid shooting" />
        <.input field={@form[:mid_dribbling]} type="number" label="Mid dribbling" />
        <.input field={@form[:mid_flair]} type="number" label="Mid flair" />
        <.input field={@form[:att_shooting]} type="number" label="Att shooting" />
        <.input field={@form[:att_heading]} type="number" label="Att heading" />
        <.input field={@form[:att_link_up]} type="number" label="Att link up" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Player</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{player: player} = assigns, socket) do
    changeset = People.change_player(player)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"player" => player_params}, socket) do
    changeset =
      socket.assigns.player
      |> People.change_player(player_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"player" => player_params}, socket) do
    save_player(socket, socket.assigns.action, player_params)
  end

  defp save_player(socket, :edit, player_params) do
    case People.update_player(socket.assigns.player, player_params) do
      {:ok, player} ->
        notify_parent({:saved, player})

        {:noreply,
         socket
         |> put_flash(:info, "Player updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_player(socket, :new, player_params) do
    case People.create_player(player_params) do
      {:ok, player} ->
        notify_parent({:saved, player})

        {:noreply,
         socket
         |> put_flash(:info, "Player created successfully")
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
