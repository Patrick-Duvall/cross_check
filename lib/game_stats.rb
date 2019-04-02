module GameStatistics


  def highest_total_score
    highest = @game_stats.max_by do |id,game|
      game[:home_goals] + game[:away_goals]
    end
    highest[1][:home_goals] + highest[1][:away_goals]
  end

  def lowest_total_score
    lowest = @game_stats.min_by do |id, game|
      game[:home_goals] + game[:away_goals]
    end
    lowest[1][:home_goals] + lowest[1][:away_goals]
  end

  def biggest_blowout
    biggest = @game_stats.max_by do |id, game|
      (game[:home_goals] - game[:away_goals]).abs
    end
    (biggest[1][:home_goals] - biggest[1][:away_goals]).abs
  end

  def percentage_home_wins
    @game_stats.count{|id, game| game[:outcome].include?("home")} / @game_stats.count.to_f
  end

  def percentage_away_wins
    @game_stats.count{|id, game| game[:outcome].include?("away")} / @game_stats.count.to_f
  end

  def count_of_games_by_season
    hash = {}
    @game_stats.each do |id, game|
      unless hash.keys.include?(game[:season].to_s)
        hash[game[:season].to_s] = 1
      else
        hash[game[:season].to_s] += 1
      end
    end
    hash
  end

  def average_goals_per_game
    total_score = 0
    @game_stats.each do |id, game|
      total_score += (game[:home_goals] + game[:away_goals])
    end
    (total_score.to_f / @game_stats.length).round(2)
  end

  def average_goals_by_season
    hash = {}
    @game_stats.each do |id, game|
      unless hash.keys.include?(game[:season].to_s)
        hash[game[:season].to_s] = [(game[:home_goals] + game[:away_goals])]
      else
        hash[game[:season].to_s] << (game[:home_goals] + game[:away_goals])
      end
    end
    hash.transform_values{|el| el.sum / el.length.to_f}
  end

end
