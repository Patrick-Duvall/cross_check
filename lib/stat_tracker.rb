require "csv"
require "./lib/game_stats"
class StatTracker
  include GameStatistics
  attr_reader :game_stats, :team_stats

  def initialize
    @game_stats = {}
    @team_stats = {}
  end

  def from_csv(locations)
   games_table = CSV.table(locations[:games], options = Hash.new)
   games_table.each do |game|
     @game_stats[game[:game_id]] = {
       season: game[:season],
       home_goals: game[:home_goals],
       away_goals: game[:away_goals],
       outcome: game[:outcome]
     }
    end
    team_table = CSV.table(locations[:teams], options = Hash.new)
    team_table.each do |team|
      # require "pry" ; binding.pry
     @team_stats[team[:team_id]] = {
       franchise_id: team[:franchiseid],
       short_name: team[:shortname],
       team_name: team[:teamname],
       abbreviation: team[:abbreviation]
     }
    end
  end
end
