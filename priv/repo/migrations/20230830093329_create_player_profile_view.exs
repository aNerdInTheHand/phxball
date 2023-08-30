defmodule Phxball.Repo.Migrations.CreatePlayerProfileView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW player_profiles AS
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
      pl.phys_cardio,
      pl.phys_recovery,
      pl.phys_resilience,
      pl.phys_speed,
      pl.phys_strength,
      pl.gk_crosses,
      pl.gk_distribution,
      pl.gk_shotstopping,
      pl.def_attacking,
      pl.def_heading,
      pl.def_marking,
      pl.def_positioning,
      pl.def_tackling,
      pl.mid_dribbling,
      pl.mid_flair,
      pl.mid_passing,
      pl.mid_positioning,
      pl.mid_shooting,
      pl.att_heading,
      pl.att_link_up,
      pl.att_shooting
    from players pl
    join people pe on pl.person_id = pe.id
    join clubs c on pe.club_id = c.id;
    """
  end
end
