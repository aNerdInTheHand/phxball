defmodule Phxball.Repo.Migrations.CreateAttProfileView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW att_profiles AS
    select pe.first_name,
      pe.last_name,
      pe.id as person_id,
      pl.id as player_id,
      c.id as club_id,
      pl.position,
      pl.men_aggression,
      pl.men_composure,
      pl.men_fortitude,
      pl.men_intelligence,
      pl.phys_speed,
      pl.phys_strength,
      pl.att_heading,
      pl.att_link_up,
      pl.att_shooting
    from players pl
    join people pe on pl.person_id = pe.id
    join clubs c on pe.club_id = c.id
    where pl.position like 'att%';
    """
  end
end
