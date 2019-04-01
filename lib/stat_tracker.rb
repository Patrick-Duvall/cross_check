require "csv"
class StatTracker

attr_reader :game_stats

  def initialize
    @game_stats = {}
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
  end
end
