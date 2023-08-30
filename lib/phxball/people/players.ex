defmodule Phxball.Players.Players do
  alias Phxball.People.Const

  def calculate_overall(%{position: position} = player) do
    cond do
      to_string(position) =~ "gk" -> calculate_gk_overall(player)
      to_string(position) =~ "def_lb" -> calculate_lb_rb_overall(player)
      to_string(position) =~ "def_rb" -> calculate_lb_rb_overall(player)
      to_string(position) =~ "def_cb" -> calculate_cb_overall(player)
      to_string(position) =~ "def_cm" -> calculate_cm_overall(player)
      to_string(position) =~ "mid_l" -> calculate_lw_rw_overall(player)
      to_string(position) =~ "mid_r" -> calculate_lw_rw_overall(player)
      to_string(position) =~ "att_" -> calculate_att_overall(player)
      true -> 50
    end
  end

  defp calculate_gk_overall(player) do

  end
end
