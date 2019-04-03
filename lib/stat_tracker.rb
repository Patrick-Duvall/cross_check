require "csv"
require "./lib/game_stats"
require "./lib/league_stats"

class StatTracker
  include GameStatistics, LeagueStatistics
  attr_reader :game_stats,
              :team_stats,
              :game_teams

  def initialize
    @game_stats = {}
    @team_stats = {}
    @game_teams = {}
  end

  def from_csv(locations)
   games_table = CSV.table(locations[:games], options = Hash.new)
   games_table.each do |game|
     @game_stats[game[:game_id]] = {
       away_team: {},
       home_team:{game-stats-info},
       season:     game[:season],
       home_goals: game[:home_goals],
       away_goals: game[:away_goals],
       outcome:    game[:outcome]
      }
    end
    team_table = CSV.table(locations[:teams], options = Hash.new)
    team_table.each do |team|
     @team_stats[team[:team_id]] = {
       franchise_id: team[:franchiseid],
       short_name:   team[:shortname],
       team_name:    team[:teamname],
       abbreviation: team[:abbreviation]
      }
    end
    league_table = CSV.table(locations[:game_teams], options = Hash.new)
    league_table.each do |game_stat|
    unless @game_teams.keys.include?(game_stat[:team_id])
      @game_teams[game_stat[:team_id]] = {
      game_stat[:game_id] => {
      home_away: game_stat[:hoa],
      goals:     game_stat[:goals],
      won:       game_stat[:won]
      }
    }
    else
      @game_teams[game_stat[:team_id]][game_stat[:game_id]] = {
      home_away: game_stat[:hoa],
      goals:     game_stat[:goals],
      won:       game_stat[:won]
      }
    end
    end
  end

end
