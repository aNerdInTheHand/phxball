defmodule Phxball.Repo.Migrations.CreateClubs do
  use Ecto.Migration

  def change do
    create table(:clubs) do
      add :name, :string
      add :country, :string
      add :reputation, :integer
      add :balance, :integer
      add :stadium_id, :integer
      add :short_name, :string
      add :initials, :string

      timestamps()
    end
  end
end
