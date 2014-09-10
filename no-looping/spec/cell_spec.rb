require './cell'

describe Cell do
  subject { described_class }

  it "has a x coordinate" do
    x_coordinate = 0
    y_coordinate = 1
    cell = subject.new(x_coordinate, y_coordinate)
    expect(cell.x).to eq(x_coordinate)
  end

  it "has a y coordinate" do
    x_coordinate = 0
    y_coordinate = 1
    cell = subject.new(x_coordinate, y_coordinate)
    expect(cell.y).to eq(y_coordinate)
  end

  it "has a default state of :alive" do
    cell = subject.new(0,0)
    expect(cell.state).to eq(:alive)
  end

  it "has a mutable state" do
    cell = subject.new(0,0)
    cell.state = :dead
    expect(cell.state).to eq(:dead)
  end
end
