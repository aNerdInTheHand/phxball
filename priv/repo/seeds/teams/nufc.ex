defmodule Phxball.Teams.Nufc do
  alias Phxball.{
    PersonBuilder,
    PlayerBuilder
  }
  alias Phxball.People.{
    Person,
    Player
  }
  alias Phxball.ClubBuilder, as: CB

  def highest_salary(), do: Faker.random_between(90000, 125000)
  def higher_salary(), do: Faker.random_between(70000, 90000)
  def high_salary(), do: Faker.random_between(50000, 90000)
  def mid_salary(), do: Faker.random_between(35000, 50000)
  def low_salary(), do: Faker.random_between(25000, 35000)
  def lower_salary(), do: Faker.random_between(15000, 25000)
  def lowest_salary(), do: Faker.random_between(5000, 15000)

  def create() do
    %{id: club_id} = create_club()
  end

  defp create_club() do
    %{id: club_id} = CB.build()
    |> CB.with_name("Newcastle United Football Club")
    |> CB.with_initials("NUFC")
    |> CB.with_short_name("Newcastle")
    |> CB.with_reputation(90)
    |> CB.insert()

    create_players(club_id)
  end

  defp create_players(club_id) do
    goalkeepers(club_id)
    defenders(club_id)
    midfielders(club_id)
    attackers(club_id)
  end

  defp goalkeepers(club_id) do
    nick_pope(club_id)
    martin_dubravka(club_id)
    loris_karius(club_id)
    mark_gillespie(club_id)
  end

  defp defenders(club_id) do
    kieran_trippier(club_id)
    paul_dummett(club_id)
    sven_botman(club_id)
    fabian_schar(club_id)
    jamaal_lascelles(club_id)
    matt_target(club_id)
    emil_krafth(club_id)
    javier_manquillo(club_id)
    lewis_hall(club_id)
    valentino_livramento(club_id)
    dan_burn(club_id)
    remi_savage(club_id)
    charlie_wiggett(club_id)
    alex_murphy(club_id)
  end

  defp midfielders(club_id) do
    joelinton(club_id)
    sandro_tonali(club_id)
    anthony_gordon(club_id)
    matt_ritchie(club_id)
    harvey_barnes(club_id)
    jacob_murphy(club_id)
    miguel_almiron(club_id)
    joe_willock(club_id)
    elliot_anderson(club_id)
    sean_longstaff(club_id)
    bruno_guimaraes(club_id)
    lewis_miley(club_id)
  end

  defp attackers(club_id) do
    callum_wilson(club_id)
    alexander_isak(club_id)
  end

  defp nick_pope(club_id) do
    %{id: person_id} = %Person{
      first_name: "Nick",
      last_name: "Pope",
      dob: ~D[1992-04-19],
      gender: :male,
      reputation: 89,
      role: :player,
      wage: highest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_world_class_gk_stats()
    |> PlayerBuilder.insert()
  end

  defp martin_dubravka(club_id) do
    %{id: person_id} = %Person{
      first_name: "Martin",
      last_name: "Dubravka",
      dob: ~D[1989-01-15],
      gender: :male,
      reputation: 84,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:excellent, "gk")
    |> PlayerBuilder.insert()
  end

  defp loris_karius(club_id) do
    %{id: person_id} = %Person{
      first_name: "Loris",
      last_name: "Karius",
      dob: ~D[1993-06-22],
      gender: :male,
      reputation: 74,
      role: :player,
      wage: low_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:good, "gk")
    |> PlayerBuilder.insert()
  end

  defp mark_gillespie(club_id) do
    %{id: person_id} = %Person{
      first_name: "Mark",
      last_name: "Gillespie",
      dob: ~D[1992-03-27],
      gender: :male,
      reputation: 50,
      role: :player,
      wage: lowest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:gk_gk)
    |> PlayerBuilder.with_level_and_position(:decent, "gk")
    |> PlayerBuilder.insert()
  end

  defp kieran_trippier(club_id) do
    %{id: person_id} = %Person{
      first_name: "Kieran",
      last_name: "Trippier",
      dob: ~D[1990-09-19],
      gender: :male,
      reputation: 94,
      role: :player,
      wage: highest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_rb_att)
    |> PlayerBuilder.with_level_and_position(:world_class, "lb_rb")
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp paul_dummett(club_id) do
    %{id: person_id} = %Person{
      first_name: "Paul",
      last_name: "Dummett",
      dob: ~D[1991-09-26],
      gender: :male,
      reputation: 65,
      role: :player,
      wage: low_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_lb_def)
    |> PlayerBuilder.with_level_and_position(:decent, "lb_rb")
    |> PlayerBuilder.insert()
  end

  defp sven_botman(club_id) do
    %{id: person_id} = %Person{
      first_name: "Sven",
      last_name: "Botman",
      dob: ~D[2000-01-12],
      gender: :male,
      reputation: 88,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_def)
    |> PlayerBuilder.with_level_and_position(:excellent, "cb")
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp fabian_schar(club_id) do
    %{id: person_id} = %Person{
      first_name: "Fabian",
      last_name: "Schar",
      dob: ~D[1991-12-20],
      gender: :male,
      reputation: 83,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_att)
    |> PlayerBuilder.with_level_and_position(:excellent, "cb")
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp jamaal_lascelles(club_id) do
    %{id: person_id} = %Person{
      first_name: "Jamaal",
      last_name: "Lascelles",
      dob: ~D[1993-11-11],
      gender: :male,
      reputation: 81,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_def)
    |> PlayerBuilder.with_level_and_position(:very_good, "cb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp matt_target(club_id) do
    %{id: person_id} = %Person{
      first_name: "Matt",
      last_name: "Targett",
      dob: ~D[1995-09-18],
      gender: :male,
      reputation: 79,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_lb_def)
    |> PlayerBuilder.with_level_and_position(:very_good, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp emil_krafth(club_id) do
    %{id: person_id} = %Person{
      first_name: "Emil",
      last_name: "Krafth",
      dob: ~D[1994-08-02],
      gender: :male,
      reputation: 79,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_rb_def)
    |> PlayerBuilder.with_level_and_position(:very_good, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp javier_manquillo(club_id) do
    %{id: person_id} = %Person{
      first_name: "Javier",
      last_name: "Manquillo",
      dob: ~D[1994-05-05],
      gender: :male,
      reputation: 79,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_rb_def)
    |> PlayerBuilder.with_level_and_position(:very_good, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp lewis_hall(club_id) do
    %{id: person_id} = %Person{
      first_name: "Lewis",
      last_name: "Hall",
      dob: ~D[2004-09-08],
      gender: :male,
      reputation: 83,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_lb_att)
    |> PlayerBuilder.with_level_and_position(:excellent, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp valentino_livramento(club_id) do
    %{id: person_id} = %Person{
      first_name: "Valentino",
      last_name: "Livramento",
      dob: ~D[2002-11-12],
      gender: :male,
      reputation: 84,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_rb_att)
    |> PlayerBuilder.with_level_and_position(:excellent, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp remi_savage(club_id) do
    %{id: person_id} = %Person{
      first_name: "Remi",
      last_name: "Savage",
      dob: ~D[2001-10-26],
      gender: :male,
      reputation: 50,
      role: :player,
      wage: lowest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_def)
    |> PlayerBuilder.with_level_and_position(:poor, "lb_rb")
    |> PlayerBuilder.insert()
  end

  defp dan_burn(club_id) do
    %{id: person_id} = %Person{
      first_name: "Dan",
      last_name: "Burn",
      dob: ~D[1992-05-09],
      gender: :male,
      reputation: 82,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_lb_def)
    |> PlayerBuilder.with_level_and_position(:excellent, "lb_rb")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp charlie_wiggett(club_id) do
    %{id: person_id} = %Person{
      first_name: "Charlie",
      last_name: "Wiggett",
      dob: ~D[2002-11-02],
      gender: :male,
      reputation: 30,
      role: :player,
      wage: lowest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_def)
    |> PlayerBuilder.with_level_and_position(:poor, "cb")
    |> PlayerBuilder.insert()
  end

  defp alex_murphy(club_id) do
    %{id: person_id} = %Person{
      first_name: "Alex",
      last_name: "Murphy",
      dob: ~D[2004-06-25],
      gender: :male,
      reputation: 50,
      role: :player,
      wage: lowest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:def_cb_def)
    |> PlayerBuilder.with_level_and_position(:mediocre, "cb")
    |> PlayerBuilder.insert()
  end

  defp joelinton(club_id) do
    %{id: person_id} = %Person{
      first_name: "",
      last_name: "Joelinton",
      dob: ~D[1996-08-14],
      gender: :male,
      reputation: 85,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_boxtobox)
    |> PlayerBuilder.with_level_and_position(:amazing, "cm")
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp sandro_tonali(club_id) do
    %{id: person_id} = %Person{
      first_name: "Sandro",
      last_name: "Tonali",
      dob: ~D[2000-08-05],
      gender: :male,
      reputation: 92,
      role: :player,
      wage: highest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_boxtobox)
    |> PlayerBuilder.with_level_and_position(:world_class, "cm")
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp anthony_gordon(club_id) do
    %{id: person_id} = %Person{
      first_name: "Anthony",
      last_name: "Gordon",
      dob: ~D[2001-02-24],
      gender: :male,
      reputation: 85,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_lw_att)
    |> PlayerBuilder.with_level_and_position(:excellent, "lw_rw")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp matt_ritchie(club_id) do
    %{id: person_id} = %Person{
      first_name: "Matt",
      last_name: "Ritchie",
      dob: ~D[1989-09-10],
      gender: :male,
      reputation: 75,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_rm_att)
    |> PlayerBuilder.with_level_and_position(:good, "lw_rw")
    |> PlayerBuilder.insert()
  end

  defp harvey_barnes(club_id) do
    %{id: person_id} = %Person{
      first_name: "Harvey",
      last_name: "Barnes",
      dob: ~D[1997-12-09],
      gender: :male,
      reputation: 78,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_lw_att)
    |> PlayerBuilder.with_level_and_position(:very_good, "lw_rw")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp jacob_murphy(club_id) do
    %{id: person_id} = %Person{
      first_name: "Jacob",
      last_name: "Murphy",
      dob: ~D[1995-02-24],
      gender: :male,
      reputation: 73,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_rm_balanced)
    |> PlayerBuilder.with_level_and_position(:very_good, "lw_rw")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp miguel_almiron(club_id) do
    %{id: person_id} = %Person{
      first_name: "Miguel",
      last_name: "Almiron",
      dob: ~D[1994-02-10],
      gender: :male,
      reputation: 81,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_rm_balanced)
    |> PlayerBuilder.with_level_and_position(:very_good, "lw_rw")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp joe_willock(club_id) do
    %{id: person_id} = %Person{
      first_name: "Joe",
      last_name: "Willock",
      dob: ~D[1999-08-20],
      gender: :male,
      reputation: 82,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_att)
    |> PlayerBuilder.with_level_and_position(:excellent, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp elliot_anderson(club_id) do
    %{id: person_id} = %Person{
      first_name: "Elliot",
      last_name: "Anderson",
      dob: ~D[2002-11-06],
      gender: :male,
      reputation: 74,
      role: :player,
      wage: mid_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_att)
    |> PlayerBuilder.with_level_and_position(:very_good, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp sean_longstaff(club_id) do
    %{id: person_id} = %Person{
      first_name: "Sean",
      last_name: "Longstaff",
      dob: ~D[1997-10-30],
      gender: :male,
      reputation: 79,
      role: :player,
      wage: high_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_boxtobox)
    |> PlayerBuilder.with_level_and_position(:very_good, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp bruno_guimaraes(club_id) do
    %{id: person_id} = %Person{
      first_name: "Bruno",
      last_name: "Guimaraes",
      dob: ~D[1997-11-16],
      gender: :male,
      reputation: 93,
      role: :player,
      wage: highest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_boxtobox)
    |> PlayerBuilder.with_level_and_position(:world_class, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp lewis_miley(club_id) do
    %{id: person_id} = %Person{
      first_name: "Lewis",
      last_name: "Miley",
      dob: ~D[2006-05-01],
      gender: :male,
      reputation: 60,
      role: :player,
      wage: lowest_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:mid_cm_att)
    |> PlayerBuilder.with_level_and_position(:decent, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.insert()
  end

  defp callum_wilson(club_id) do
    %{id: person_id} = %Person{
      first_name: "Callum",
      last_name: "Wilson",
      dob: ~D[1992-02-27],
      gender: :male,
      reputation: 91,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:att_cf_pressing)
    |> PlayerBuilder.with_level_and_position(:amazing, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end

  defp alexander_isak(club_id) do
    %{id: person_id} = %Person{
      first_name: "Alexander",
      last_name: "Isak",
      dob: ~D[1999-09-21],
      gender: :male,
      reputation: 87,
      role: :player,
      wage: higher_salary(),
      club_id: club_id
    } |> PersonBuilder.insert()

    PlayerBuilder.build_for_person(person_id)
    |> PlayerBuilder.with_specific_position(:att_cf_wide)
    |> PlayerBuilder.with_level_and_position(:amazing, "cm")
    |> PlayerBuilder.with_world_class_physical_stats()
    |> PlayerBuilder.with_world_class_mental_stats()
    |> PlayerBuilder.insert()
  end
end
