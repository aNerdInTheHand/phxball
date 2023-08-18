defmodule Phxball.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :position, :string
      add :men_aggression, :integer
      add :men_composure, :integer
      add :men_fortitude, :integer
      add :phys_cardio, :integer
      add :phys_speed, :integer
      add :phys_recovery, :integer
      add :phys_resilience, :integer
      add :gk_shotstopping, :integer
      add :gk_crosses, :integer
      add :gk_distribution, :integer
      add :def_marking, :integer
      add :def_positioning, :integer
      add :def_heading, :integer
      add :def_tackling, :integer
      add :def_attacking, :integer
      add :mid_positioning, :integer
      add :mid_passing, :integer
      add :mid_shooting, :integer
      add :mid_dribbling, :integer
      add :mid_flair, :integer
      add :att_shooting, :integer
      add :att_heading, :integer
      add :att_link_up, :integer
      add :person_id, references(:people, on_delete: :nothing)

      timestamps()
    end

    create index(:players, [:person_id])
  end
end
