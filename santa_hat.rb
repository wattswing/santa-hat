puts "Welcome to the hat game!"

# Let empty to add players one by one:
# players = []
players = %W[Alice Bob Simone]

if players.empty?
  # Aquiring participants if not provided
  loop do
    puts "Please enter a new participant name (leave blank name to stop):"
    player = gets.strip.chomp
    break if player.empty?

    players << player
  end
end

puts "Shuffling our #{players.count} participants from the hat..."

givers = players.shuffle
receivers = players.shuffle

# Re-randomizing receivers until nobody gives to self:
while givers.zip(receivers).any? { |player, receiver| player == receiver }
  receivers = players.shuffle
end

final_list = {}
givers.each_with_index do |giver, i|
  final_list[giver] = receivers[i]
end

final_list.each do |giver, receiver|
  puts "#{giver} will offer a gift to #{receiver}"
end

