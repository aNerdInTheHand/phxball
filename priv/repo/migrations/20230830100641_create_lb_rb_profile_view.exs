defmodule Phxball.Repo.Migrations.CreateLbRbProfileView do
  use Ecto.Migration

  def change do
    execute """
    CREATE VIEW lb_rb_profiles AS
    select pe.first_name,
      pe.last_name,
      pe.id as person_id,
      pl.id as player_id,
      c.id as club_id,
      pl.position,
      pl.men_intelligence,
      pl.phys_speed,
      pl.phys_cardio,
      pl.mid_passing,
      pl.def_positioning,
      pl.def_tackling,
      pl.def_attacking
    from players pl
    join people pe on pl.person_id = pe.id
    join clubs c on pe.club_id = c.id
    where pl.position like '%def_lb%'
    or pl.position like '%def_rb%';
    """
  end
end
