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

      timestamps()
    end
  end
end
