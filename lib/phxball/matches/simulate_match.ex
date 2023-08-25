defmodule Phxball.MatchEngine.SimulateMatch do
  @moduledoc """
  Performs the logic for simulating match events and results.
  """
  # alias Phxball.MatchEngine.Match
  # alias Phxball.MatchEngine.LineUp

  @doc """
  Returns a match result.

  Plan here is to do something along the lines of:
    * create a `%Lineup{}` for each team, eventually based on fancy logic but initially e.g. the best gk, 4 defenders, 4 midfields and 2 attackers
      * this is a join table for match_id + player_id, e.g. ```home_lineup = select * from lineups where club_id = player.club_id```
    * with some pseudo-randomness, influenced by different player traits, simulate events through helper functions, e.g.:


  ## Examples

      iex> generate_result(home_team, away_team)
      %Result{
        home_goals: 1,
        away_goals: 3,
        home_goalscorers: [37],
        away_goalscorers: [14, 19, 14]
      }

  """
  def generate_result(home_team, away_team) do
    [0, 0]
  end
end
