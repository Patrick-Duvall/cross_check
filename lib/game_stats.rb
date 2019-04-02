module GameStatistics

  def games
    @game_stats.values
  end

  def highest_total_score
    highest = games.max_by do |game|
      game[:home_goals] + game[:away_goals]
    end
    highest[:home_goals] + highest[:away_goals]
  end

  def lowest_total_score
    lowest = games.min_by do |game|
      game[:home_goals] + game[:away_goals]
    end
    lowest[:home_goals] + lowest[:away_goals]
  end

  def biggest_blowout
    biggest = games.max_by do |game|
      (game[:home_goals] - game[:away_goals]).abs
    end
    (biggest[:home_goals] - biggest[:away_goals]).abs
  end

  def percentage_home_wins
    games.count{|game| game[:outcome].include?("home")} / games.count.to_f
  end

  def percentage_away_wins
    games.count{|game| game[:outcome].include?("away")} / games.count.to_f

  end

  def count_of_games_by_season
    games.reduce({}) do |retval,game1|
      length =games.count{|game| game[:season] == game1[:season]}
      retval[game1[:season].to_s] = length
        retval
    end
  end

  def average_goals_per_game
    total_score = games.reduce(0) do |total, game|
      total +(game[:home_goals] + game[:away_goals])
    end
    (total_score.to_f / games.length).round(2)
  end

  def average_goals_by_season
    hash = {}
      games.each do |game|
       unless hash.keys.include?(game[:season].to_s)
         hash[game[:season].to_s] = [(game[:home_goals] + game[:away_goals])]
       else
         hash[game[:season].to_s] << (game[:home_goals] + game[:away_goals])
       end
    end
    hash.transform_values{|el| el.sum / el.length.to_f}
  end

end
