defmodule Phxball.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :first_name, :string
      add :last_name, :string
      add :dob, :date
      add :gender, :string
      add :role, :string
      add :wage, :integer
      add :reputation, :integer
      add :club_id, references(:clubs, on_delete: :nothing)

      timestamps()
    end

    create index(:people, [:club_id])
  end
end
