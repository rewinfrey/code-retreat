require './cell'

class Universe
  attr_reader :x_dimension, :y_dimension, :cell, :cells

  def initialize(x_dimension, y_dimension, cell)
    @x_dimension = x_dimension
    @y_dimension = y_dimension
    @cell = cell
    @cells = []
    initialize_cells(0, 0)
  end

  def alive_neighbors_count(cell)
    count = 0
    count += 1 if alive?(cell.x - 1, cell.y + 1)
    count += 1 if alive?(cell.x,     cell.y + 1)
    count += 1 if alive?(cell.x + 1, cell.y + 1)
    count += 1 if alive?(cell.x - 1, cell.y)
    count += 1 if alive?(cell.x + 1, cell.y)
    count += 1 if alive?(cell.x - 1, cell.y - 1)
    count += 1 if alive?(cell.x,     cell.y - 1)
    count += 1 if alive?(cell.x + 1, cell.y - 1)
  end

  private

  def alive?(x_coordinate, y_coordinate)
    if exists?(x_coordinate, y_coordinate)
      cells[x_coordinate][y_coordinate].state == :alive
    end
  end

  def exists?(x_coordinate, y_coordinate)
    cells[x_coordinate] && cells[x_coordinate][y_coordinate]
  end

  def initialize_cells(current_x, current_y)
    if current_x < x_dimension
      if current_y < y_dimension
        accumulate_cells(current_x, current_y)
        return initialize_cells(current_x, current_y + 1)
      end
      return initialize_cells(current_x + 1, 0)
    end
  end

  def accumulate_cells(current_x, current_y)
    @cells[current_x] = @cells[current_x] || []
    @cells[current_x][current_y] = cell.new(current_x, current_y)
  end
end
