defmodule Phxball.Repo.Migrations.AddSimplePlayersTable do
  use Ecto.Migration

  def change do
    create table(:simple_players) do
      add :position, :string
      add :overall, :integer
      add :person_id, references(:people, on_delete: :nothing)

      timestamps()
    end

    create index(:simple_players, [:person_id])
  end
end
