// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

/**
* start of person and people
*/

enum genders {
  male
  female
  other
}

Table person {
  id integer [primary key]
  first_name varchar
  last_name varchar
  dob date
  gender genders
  role varchar
  wage integer
  reputation integer

  Note: 'The base type for every person in the game'
}

Table player {
  id integer [primary key]
  person_id integer
  is_injured boolean
  position varchar
  men_aggression integer
  men_composure integer
  men_fortitude integer
  phys_cardio integer
  phys_speed integer
  phys_recovery integer
  phys_resilience integer
  gk_shotstopping integer
  gk_crosses integer
  gk_distribution integer
  def_marking integer
  def_positioning integer
  def_heading integer
  def_tackling integer
  def_attacking integer
  mid_positioning integer
  mid_passing integer
  mid_shooting integer
  mid_dribbling integer
  mid_flair integer
  att_shooting integer
  att_heading integer
  att_link_up integer
}

enum coach_roles {
  manager
  assistant_manager
  coach
  physio
  // TODO: add more
}

Table coach {
  id integer [primary key]
  person_id integer
  role coach_roles
  tactical integer
  attacking integer
  defending integer
  fitness integer
  motivating integer
}

enum administrator_roles {
  data_analyst
  scout
  director_of_football
}

Table administrator {
  id integer [primary key]
  person_id integer
  role administrator_roles
}

enum injury_types {
  impact
  muscle
  break
  ligament
  illness
}

Table injury {
  id integer [primary key]
  name varchar
  injury_type injury_types
  severity integer
  max_days_out integer
  min_days_out integer
}

Table player_injuries as pi {
  id integer [primary key] // does this need a unique id?
  player_id integer // or person_id?
  injury_id integer
  days_out integer
  start_date date
  end_date date
}

/**
* end of person and people
*/

/**
* start of club and teams
*/
Table club {
  id integer [primary key]
  name varchar
  country string // TODO - countries table?
  reputation integer
}

enum team_genders {
  mens
  womens
}

enum team_types {
  senior
  reserve
  u23
  u21
  u19
  u18
  u17
  u16
  u14
  u11
}

Table team {
  id integer [primary key]
  club_id integer
  team_gender team_genders
  team_type team_types
}

Table national_team {
  id integer [primary key]
  Note: 'Not MVP'
}

/**
* end of club and teams
*/

// person relationships
REF: player.person_id < person.id
REF: coach.person_id < person.id
REF: administrator.person_id < person.id
REF: pi.player_id < player.id
REF: pi.injury_id < injury.id

// club relationships
REF: team.club_id > club.id
