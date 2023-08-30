defmodule Phxball.Repo.Migrations.CreateLwRwProfileView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW lw_rw_profiles AS
    select pe.first_name,
      pe.last_name,
      pe.id as person_id,
      pl.id as player_id,
      c.id as club_id,
      pl.position,
      pl.men_intelligence,
      pl.phys_cardio,
      pl.phys_speed,
      pl.mid_flair,
      pl.mid_dribbling,
      pl.mid_passing
    from players pl
    join people pe on pl.person_id = pe.id
    join clubs c on pe.club_id = c.id
    where pl.position like '%mid_l%'
    or pl.position like '%mid_r%';
    """
  end
end
