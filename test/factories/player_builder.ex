defmodule Phxball.PlayerBuilder do
  alias Phxball.Repo
  alias Phxball.People.{
    Const,
    Player
  }

  def build_for_person(person_id) do
    default_attrs()
    |> Map.put(:person_id, person_id)
  end

  def with_specific_position(player, position) do
    Map.put(player, :position, position)
  end

  defp default_attrs do
    %Player{
      att_heading: Faker.random_between(1, 100),
      att_link_up: Faker.random_between(1, 100),
      att_shooting: Faker.random_between(1, 100),
      def_attacking: Faker.random_between(1, 100),
      def_heading: Faker.random_between(1, 100),
      def_marking: Faker.random_between(1, 100),
      def_positioning: Faker.random_between(1, 100),
      def_tackling: Faker.random_between(1, 100),
      gk_crosses: Faker.random_between(1, 100),
      gk_distribution: Faker.random_between(1, 100),
      gk_shotstopping: Faker.random_between(1, 100),
      men_aggression: Faker.random_between(1, 100),
      men_composure: Faker.random_between(1, 100),
      men_fortitude: Faker.random_between(1, 100),
      men_intelligence: Faker.random_between(1, 100),
      mid_dribbling: Faker.random_between(1, 100),
      mid_flair: Faker.random_between(1, 100),
      mid_passing: Faker.random_between(1, 100),
      mid_positioning: Faker.random_between(1, 100),
      mid_shooting: Faker.random_between(1, 100),
      phys_cardio: Faker.random_between(1, 100),
      phys_recovery: Faker.random_between(1, 100),
      phys_resilience: Faker.random_between(1, 100),
      phys_speed: Faker.random_between(1, 100),
      phys_strength: Faker.random_between(1, 100),
      position: Enum.random Const.positions()
    }
  end

  def with_level_and_position(player, level, position_prefix) do
    {upper_bound, lower_bound} = case level do
      :world_class -> {90, 100}
      :amazing -> {85, 95}
      :excellent -> {80, 90}
      :very_good -> {75, 87}
      :good -> {70, 82}
      :decent -> {60, 75}
      :mediocre -> {55, 70}
      :poor -> {45, 65}
      :very_poor -> {30, 50}
      :terrible -> {20, 40}
      :shocking -> {15, 30}
      :lowest -> {10, 25}
      :barely_functional -> {1, 15}
      _ -> {1, 100}
    end

    with_stats(player, position_prefix, lower_bound, upper_bound)
  end

  def with_world_class_gk_stats(player), do: with_level_and_position(player, :world_class, "gk")
  def with_amazing_gk_stats(player), do: with_level_and_position(player, :amazing, "gk")
  def with_excellent_gk_stats(player), do: with_level_and_position(player, :excellent, "gk")
  def with_world_class_lb_rb_stats(player), do: with_level_and_position(player, :world_class, "lb_rb")
  def with_world_class_cb_stats(player), do: with_level_and_position(player, :world_class, "cb")
  def with_world_class_cm_stats(player), do: with_level_and_position(player, :world_class, "cm")
  def with_world_class_lw_rw_stats(player), do: with_level_and_position(player, :world_class, "lw_rw")
  def with_world_class_att_stats(player), do: with_level_and_position(player, :world_class, "att")

  def with_pace(player), do: Map.put(player, :phys_speed, Faker.random_between(90, 100))
  def with_pace(player, pace), do: Map.put(player, :phys_speed, pace)
  def with_strength(player), do: Map.put(player, :phys_strength, Faker.random_between(90, 100))
  def with_strength(player, strength), do: Map.put(player, :phys_strength, strength)

  def with_world_class_physical_stats(player), do: Map.merge(player, good_phys_stats())
  def with_world_class_mental_stats(player), do: Map.merge(player, good_phys_stats())

  defp with_stats(player, position_prefix, upper_bound, lower_bound) do
    position = position_prefix <> "_key_stats"
    key_stats_list = apply(Const, String.to_existing_atom(position), [])
    key_stats = Enum.into(
      key_stats_list,
      %{},
      fn x -> {x, Faker.random_between(lower_bound, upper_bound)} end
    )
    # refactor - double merge to lower ancillary stats without removing person_id + position
    Map.merge(player, all_low_stats()) |> Map.merge(key_stats)
  end

  defp all_low_stats() do
    %{
      att_heading: Faker.random_between(1, 10),
      att_link_up: Faker.random_between(1, 10),
      att_shooting: Faker.random_between(1, 10),
      def_attacking: Faker.random_between(1, 10),
      def_heading: Faker.random_between(1, 10),
      def_marking: Faker.random_between(1, 10),
      def_positioning: Faker.random_between(1, 10),
      def_tackling: Faker.random_between(1, 10),
      gk_crosses: Faker.random_between(1, 10),
      gk_distribution: Faker.random_between(1, 10),
      gk_shotstopping: Faker.random_between(1, 10),
      men_aggression: Faker.random_between(1, 10),
      men_composure: Faker.random_between(1, 10),
      men_fortitude: Faker.random_between(1, 10),
      men_intelligence: Faker.random_between(1, 10),
      mid_dribbling: Faker.random_between(1, 10),
      mid_flair: Faker.random_between(1, 10),
      mid_passing: Faker.random_between(1, 10),
      mid_positioning: Faker.random_between(1, 10),
      mid_shooting: Faker.random_between(1, 10),
      phys_cardio: Faker.random_between(65, 75),
      phys_recovery: Faker.random_between(65, 75),
      phys_resilience: Faker.random_between(65, 75),
      phys_speed: Faker.random_between(65, 75),
      phys_strength: Faker.random_between(65, 75)
    }
  end

  defp good_phys_stats() do
    %{
      phys_cardio: Faker.random_between(85, 100),
      phys_recovery: Faker.random_between(85, 100),
      phys_resilience: Faker.random_between(85, 100),
      phys_speed: Faker.random_between(85, 100),
      phys_strength: Faker.random_between(85, 100)
    }
  end

  defp good_mental_stats() do
    %{
      men_aggression: Faker.random_between(85, 100),
      men_composure: Faker.random_between(85, 100),
      men_fortitude: Faker.random_between(85, 100),
      men_intelligence: Faker.random_between(85, 100),
    }
  end

  def insert(player) do
    Repo.insert! player
  end
end
