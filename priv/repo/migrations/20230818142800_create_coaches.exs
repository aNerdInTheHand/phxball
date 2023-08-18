defmodule Phxball.Repo.Migrations.CreateCoaches do
  use Ecto.Migration

  def change do
    create table(:coaches) do
      add :role, :string
      add :tactical, :integer
      add :person_id, references(:people, on_delete: :nothing)

      timestamps()
    end

    create index(:coaches, [:person_id])
  end
end
