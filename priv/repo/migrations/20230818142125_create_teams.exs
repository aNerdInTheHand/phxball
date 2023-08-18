defmodule Phxball.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_gender, :string
      add :team_type, :string
      add :club_id, references(:clubs, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:club_id])
  end
end
