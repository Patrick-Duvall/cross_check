module LeagueStatistics

  def count_of_teams
    @team_stats.size
  end

  def best_offense
    best_team = @game_teams.values.max_by do |team|
      x = team.reduce(0) do |sum, game|
      #  require "pry"; binding.pry
          sum += game[1][:goals]
      end
      x.fdiv(team.count)
    end
    @team_stats[best_team[:team_id]]
    require "pry"; binding.pry
  end

end
