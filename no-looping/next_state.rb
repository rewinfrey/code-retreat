class NextState
  STATE_MAP =
  {
    :alive => {
      2 => :alive,
      3 => :alive
    },
    :dead => {
      3 => :alive
    }
  }

  def execute(current_state, num_of_alive_neighbors)
    STATE_MAP[current_state][num_of_alive_neighbors] || :dead
  end
end
