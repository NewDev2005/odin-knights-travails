def get_possible_moves(position)
  relevant_moves_relative_to_the_position = []
  if position.last <= 2
    if valid_move?([position[0] + 2, position[1] + 1])
      relevant_moves_relative_to_the_position.push([position[0] + 2, position[1] + 1])
    end

    if valid_move?([position[0] + 1, position[1] + 2])
      relevant_moves_relative_to_the_position.push([position[0] + 1, position[1] + 2])
    end

    if valid_move?([position[0] - 1, position[1] + 2])
      relevant_moves_relative_to_the_position.push([position[0] - 1, position[1] + 2])
    end

    if valid_move?([position[0] - 2, position[1] + 1])
      relevant_moves_relative_to_the_position.push([position[0] - 2, position[1] + 1])
    end

    if valid_move?([position[0] + 2, position[1] - 1])
      relevant_moves_relative_to_the_position.push([position[0] + 2, position[1] - 1])
    end

  elsif position.last > 2 && position.last <= 7

    if valid_move?([position[0] + 2, position[1] + 1])
      relevant_moves_relative_to_the_position.push([position[0] + 2, position[1] + 1])
    end

    if valid_move?([position[0] + 1, position[1] + 2])
      relevant_moves_relative_to_the_position.push([position[0] + 1, position[1] + 2])
    end

    if valid_move?([position[0] - 1, position[1] + 2])
      relevant_moves_relative_to_the_position.push([position[0] - 1, position[1] + 2])
    end

    if valid_move?([position[0] - 2, position[1] + 1])
      relevant_moves_relative_to_the_position.push([position[0] - 2, position[1] + 1])
    end

    if valid_move?([position[0] + 2, position[1] - 1])
      relevant_moves_relative_to_the_position.push([position[0] + 2, position[1] - 1])
    end

    if valid_move?([position[0] + 1, position[1] - 2])
      relevant_moves_relative_to_the_position.push([position[0] + 1, position[1] - 2])
    end

    if valid_move?([position[0] - 1, position[1] - 2])
      relevant_moves_relative_to_the_position.push([position[0] - 1, position[1] - 2])
    end
    if valid_move?([position[0] - 2, position[1] - 1])
      relevant_moves_relative_to_the_position.push([position[0] - 2, position[1] - 1])
    end
  end
  relevant_moves_relative_to_the_position
end

def valid_move?(move)
  if move.first >= 0 && move.first <= 7 && move.last >= 0 && move.last <= 7
    true
  else
    false
  end
end

p get_possible_moves([7, 7])
