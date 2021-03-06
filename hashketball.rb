# Write your code here!
require "pry"

def game_hash
  game_data = {
        home: {
           team_name: 'Brooklyn Nets',
           colors: ["Black","White"],
           players: [
             {
              player_name: 'Alan Anderson',
              number: 0,
              shoe: 16,
              points: 22,
              rebounds: 12,
              assists: 12,
              steals: 3,
              blocks: 1,
              slam_dunks: 1
           },
           {
              player_name: 'Reggie Evans',
              number: 30,
              shoe: 14,
              points: 12,
              rebounds: 12,
              assists: 12,
              steals: 12,
              blocks: 12,
              slam_dunks: 7
           },
           {
              player_name: 'Brook Lopez',
              number: 11,
              shoe: 17,
              points: 17,
              rebounds: 19,
              assists: 10,
              steals: 3,
              blocks: 1,
              slam_dunks: 15
           },
           {
              player_name: 'Mason Plumlee',
              number: 1,
              shoe: 19,
              points: 26,
              rebounds: 11,
              assists: 6,
              steals: 3,
              blocks: 8,
              slam_dunks: 5
           },
           {
              player_name: 'Jason Terry',
              number: 31,
              shoe: 15,
              points: 19,
              rebounds: 2,
              assists: 2,
              steals: 4,
              blocks: 11,
              slam_dunks: 1
           }
        ]
     },
     away: {
        team_name: 'Charlotte Hornets',
        colors: ["Turquoise", "Purple"],
        players: [
          {
           player_name: 'Jeff Adrien',
           number: 4,
           shoe: 18,
           points: 10,
           rebounds: 1,
           assists: 1,
           steals: 2,
           blocks: 7,
           slam_dunks: 2
        },
        {
           player_name: 'Bismack Biyombo',
           number: 0,
           shoe: 16,
           points: 12,
           rebounds: 4,
           assists: 7,
           steals: 22,
           blocks: 15,
           slam_dunks: 10
        },
        {
           player_name: 'DeSagna Diop',
           number: 2,
           shoe: 14,
           points: 24,
           rebounds: 12,
           assists: 12,
           steals: 4,
           blocks: 5,
           slam_dunks: 5
        },
        {
           player_name: 'Ben Gordon',
           number: 8,
           shoe: 15,
           points: 33,
           rebounds: 3,
           assists: 2,
           steals: 1,
           blocks: 1,
           slam_dunks: 0
        },
        {
           player_name: 'Kemba Walker',
           number: 33,
           shoe: 15,
           points: 6,
           rebounds: 12,
           assists: 12,
           steals: 7,
           blocks: 5,
           slam_dunks: 12
        }
     ]
  }
  }
  game_data
end

def num_points_scored(player)
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |name|
          if name[:player_name] == player
            return name[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |name|
          if name[:player_name] == player
            return name[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, team|
      if team[:team_name] == team_name
        return team[:colors]
      end
  end
end

def team_names
  teams = []
  game_hash.each do |key, team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, team|
      team[:players].each do |stats|
        if team[:team_name] == team_name
          numbers << stats[:number]
        end
      end
    end
  numbers
end

def player_stats(player)
  stats_hash = {}
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |name|
          if name[:player_name] == player
            stats_hash = name.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  biggest_shoes = 0
  rebounds = 0
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:shoe] > biggest_shoes
            biggest_shoes = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  high_scorer = ""
  most_points = 0
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:points] > most_points
            most_points = player[:points]
            high_scorer = player[:player_name]
          end
        end
      end
    end
  end
  high_scorer
end

def winning_team
  scores = {
    'Brooklyn Nets' => 0,
    'Charlotte Hornets' => 0
  }
  game_hash.each do |key, team|
      team[:players].each do |stats|
        scores[team[:team_name]] += stats[:points]
      end
    end
  scores.max_by { |a, b| b }.first
end

def player_with_longest_name
  longest_name = ""
  most_characters = 0
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:player_name].size > most_characters
            most_characters = player[:player_name].size
            longest_name = player[:player_name]
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  high_stealer = ""
  most_steals = 0
  game_hash.each do |key, team|
    team.each do |attribute, stats|
      if attribute == :players
        stats.each do |player|
          if player[:steals] > most_steals
            most_steals = player[:steals]
            high_stealer = player[:player_name]
          end
        end
      end
    end
  end
  return high_stealer == player_with_longest_name
end
