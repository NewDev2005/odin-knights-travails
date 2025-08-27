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
    arr[index] = { vertex: sub_arr, distance: nil, predecessor: nil }
  end
  arr
end

def knight_moves(start_point, end_point)
  queue = []
  visited_nodes = []
  path = []
  start_point = { vertex: start_point, distance: 0 }
  queue.push(start_point)

  push_vertices_into_queue = lambda do |vertices, source|
    vertices.each_with_index do |node, index|
      if vertices[index][:distance].nil?
        node[:distance] = source[:distance] + 1
        node[:predecessor] = source[:vertex]
        queue.push(node)
        # p vertices[index][:vertex]
      elsif !vertices[index][:distance].nil?
        next
      end
    end
  end

  until queue.empty?
    node = queue.shift
    visited_nodes.push(node)
    vertices = get_possible_moves(node[:vertex])
    break unless vertices.each do |vertex|
      if vertex[:vertex] == end_point
        path.push(node)
        break
      end
    end

    push_vertices_into_queue.call(vertices, node)
  end

  visited_nodes.each do |node|
    if path[0][:predecessor] == node[:vertex]
      path.unshift(node)
    end
  end

  path.each do |node|
    p node[:vertex]
  end
  p end_point
end

knight_moves([0, 0], [7, 7])
