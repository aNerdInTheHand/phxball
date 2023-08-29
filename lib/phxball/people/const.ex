defmodule Phxball.People.Const do
  def positions, do: positions = [
    :gk_gk,
    :gk_sweeper,
    :def_lb_def,
    :def_lb_att,
    :def_rb_def,
    :def_rb_att,
    :def_cb_def,
    :def_cb_sweeper,
    :mid_dm_def,
    :mid_dm_boxtobox,
    :mid_cm_def,
    :mid_cm_boxtobox,
    :mid_cm_balanced,
    :mid_cm_att,
    :mid_am_playmaker,
    :mid_am_freerole,
    :mid_lm_def,
    :mid_lm_balanced,
    :mid_lm_att,
    :mid_rm_def,
    :mid_rm_balanced,
    :mid_rm_att,
    :mid_lw_def,
    :mid_lw_balanced,
    :mid_lw_att,
    :mid_rw_def,
    :mid_rw_balanced,
    :mid_rw_att,
    :att_cf_complete,
    :att_cf_pressing,
    :att_cf_falsenine,
    :att_cf_wide,
    :att_cf_high
  ]

  def gk_key_stats, do: [
    :gk_crosses,
    :gk_distribution,
    :gk_shotstopping,
    :men_composure,
    :men_fortitude
  ]

  def lb_rb_key_stats, do: [
    :def_attacking,
    :def_tackling,
    :def_positioning,
    :men_intelligence,
    :mid_passing,
    :phys_cardio,
    :phys_speed
  ]

  def cb_key_stats, do: [
    :def_heading,
    :def_marking,
    :def_positioning,
    :def_tackling,
    :men_aggression,
    :men_composure,
    :phys_speed
  ]

  def cm_key_stats, do: [
    :men_aggression,
    :men_composure,
    :men_fortitude,
    :men_intelligence,
    :mid_flair,
    :mid_passing,
    :mid_positioning,
    :mid_shooting,
    :phys_cardio
  ]

  def lw_rw_key_stats, do: [
    :men_intelligence,
    :mid_dribbling,
    :mid_flair,
    :mid_passing,
    :mid_shooting,
    :phys_cardio,
    :phys_speed
  ]

  def att_key_stats, do: [
    :att_heading,
    :att_link_up,
    :att_shooting,
    :men_aggression,
    :men_composure,
    :men_fortitude,
    :men_intelligence,
    :phys_speed
  ]
end
