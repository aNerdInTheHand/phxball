defmodule Phxball.Repo.Migrations.CreateCbProfileView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW cb_profiles AS
    select pe.first_name,
      pe.last_name,
      pe.id as person_id,
      pl.id as player_id,
      c.id as club_id,
      pl.position,
      pl.men_aggression,
      pl.men_composure,
      pl.phys_speed,
      pl.phys_strength,
      pl.def_heading,
      pl.def_marking,
      pl.def_positioning,
      pl.def_tackling,
      (
        pl.men_aggression +
        pl.men_composure +
        pl.phys_speed +
        pl.phys_strength +
        pl.def_heading +
        pl.def_marking +
        pl.def_positioning +
        pl.def_tackling
      ) / 8 as overall
    from players pl
    join people pe on pl.person_id = pe.id
    join clubs c on pe.club_id = c.id
    where pl.position like '%def_cb%';
    """
  end
end
