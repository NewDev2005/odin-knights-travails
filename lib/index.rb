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

    if valid_move?([position[0] - 1, position[1] - 2])
      relevant_moves_relative_to_the_position.push([position[0] - 1, position[1] - 2])
    end

    if valid_move?([position[0] - 2, position[1] - 1])
      relevant_moves_relative_to_the_position.push([position[0] - 2, position[1] - 1])
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
  assign_default_distance_and_predecessor(relevant_moves_relative_to_the_position)
end

def valid_move?(move)
  if move.first >= 0 && move.first <= 7 && move.last >= 0 && move.last <= 7
    true
  else
    false
  end
end

def assign_default_distance_and_predecessor(arr)
  arr.each_with_index do |sub_arr, index|
    arr[index] = { vertex: sub_arr, distance: nil, path: [] }
  end
  arr
end

def knight_moves(start_point, end_point)
  queue = []
  start_point = { vertex: start_point, distance: 0, path: [start_point] }
  queue.push(start_point)

  until queue.empty?
    current_node = queue.shift
    vertices = get_possible_moves(current_node[:vertex])
    break unless vertices.each do |vertex|
      if vertex[:vertex] == end_point
        vertex[:path] = current_node[:path].push(vertex[:vertex])
        p vertex[:path]
        break
      else
        vertex[:path] = current_node[:path].push(vertex[:vertex])
      end
    end

    vertices.each do |node|
      if node[:distance].nil?
        node[:distance] = current_node[:distance] + 1
        queue.push(node)
      elsif !node[:distance].nil?
        next
      end
    end
  end
end

 knight_moves([0, 0], [7, 7])
