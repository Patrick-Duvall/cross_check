module LeagueStatistics

  def count_of_teams
    @team_stats.size
  end

<<<<<<< Updated upstream
  def best_offense
    best_team = @game_teams.max_by do |team_id, games|
      x = games.reduce(0) do |sum, game|
        sum += game[1][:goals]
      end
      x.fdiv(games.count)
    end
    @team_stats[best_team[0]][:team_name]
  end
=======

>>>>>>> Stashed changes

  def worst_offense
    worst_team = @game_teams.min_by do |team_id, games|
      x = games.reduce(0) do |sum, game|
        sum += game[1][:goals]
      end
      x.fdiv(games.count)
    end
    @team_stats[worst_team[0]][:team_name]
  end
  
end
